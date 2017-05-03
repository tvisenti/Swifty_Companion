//
//  APIHandler.swift
//  Swifty_companion
//
//  Created by Thomas VISENTIN on 4/25/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import SwiftyJSON

class Oauth {
    
    let KEY_UID = "81a5998684273145e7fabb1efe45bcbfc2f2222abf307e456f6a0039cb0f81aa"
    let KEY_SECRET = "0b4cc57b11b5b92f1ac6d3160d2625483671f775fbfe885b74f015b82f2943af"
    let API_SITE = "https://api.intra.42.fr"
    
    var access_token : String!
    var created_token : Double!
    var expired_token : Double!
    
    static let sharedInstance = Oauth()
    var user: UserInfo = UserInfo()

    func getToken() -> URL {
        return URL(string: API_SITE + "/oauth/token")!
    }
    
    func getInfoCursus(login : String) -> URL {
        return URL(string: "\(API_SITE)/v2/users/\(login)?access_token=\(access_token!)")!
    }
    
    func getUserInfo(login : String, completionHandler: @escaping (Bool, Error?, UserInfo?) -> ()) {
        DispatchQueue.global(qos: .background).async {
            var request = URLRequest(url: self.getInfoCursus(login: login))
            
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    completionHandler(false, error!, nil)
                } else if let d = data {
                    let dataString = NSString(data: d, encoding: String.Encoding.utf8.rawValue)
                    if let dataFromString = dataString?.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: false) {
                        let userJson = JSON(data: dataFromString)
                        print(userJson)
                        DispatchQueue.main.async {
                            if userJson.isEmpty == false {
                                self.user.initUserInfo(json: userJson)
                                completionHandler(true, nil, self.user)
                            } else {
                                completionHandler(false, nil, nil)
                                print("Error, no user has this name")
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func connectToAPI(completionHandler: @escaping (Bool, Error?) -> ()) {
        if access_token != nil {
            print(created_token + expired_token)
            print(Date().timeIntervalSince1970)
            if created_token + expired_token > Date().timeIntervalSince1970 {
                print("Use the old token")
                completionHandler(true, nil)
                return
            }
        }
        DispatchQueue.global(qos: .background).async {
            print("Create a new token")
            let postData: [String:String] = [
                "grant_type"    : "client_credentials",
                "client_id"     : self.KEY_UID,
                "client_secret" : self.KEY_SECRET
            ]
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: postData, options: .prettyPrinted) {
                var request = URLRequest(url: self.getToken())
                
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = jsonData
                
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if error != nil {
                        completionHandler(false, error!)
                    } else if let d = data {
                        do {
                            if let respJson: NSDictionary = try JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                print(respJson)
                                DispatchQueue.main.async {
                                    self.access_token = respJson["access_token"] as? String
                                    self.created_token = respJson["created_at"] as? Double
                                    self.expired_token = respJson["expires_in"] as? Double
                                    completionHandler(true, nil)
                                }
                            }
                        } catch (let err) {
                            completionHandler(false, err)
                        }
                    }
                }
                task.resume()
            }
        }
    }
}
