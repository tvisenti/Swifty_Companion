//
//  UserInfo.swift
//  Swifty_companion
//
//  Created by Thomas VISENTIN on 4/26/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation

class UserInfo {
    
    static let sharedInstance = UserInfo()
    
    var displayName : String = "Unvailable"
    var login : String = "Unvailable"
    var email : String = "Unvailable"
    var location : String = "Unvailable"
    var phoneNumber : String = "Unvailable"
    var correctionPoint : Int = 0
    var imageUrl : String = "Unvailable"
    
    // cursus_users
    var grade : String = "Unknown"
    var level : Float = 0
    //skills : name + level
    var skills : NSArray?
    
    // project : name + success? + final_mark + finished
    var project : [String:String]?
    
    
    func initUserInfo(infos : NSDictionary) {
        if let name = infos.object(forKey: "displayname") {
            displayName = name as! String
        }
        
        if let log = infos.object(forKey: "login") {
            login = log as! String
        }
    
        if let mail = infos.object(forKey: "email") {
            email = mail as! String
        }
        
        if let loca = infos.object(forKey: "location") {
            if loca is NSNull {
                location = "Unvailable"
            } else {
             location = loca as! String
            }
        }
        
        if let phone = infos.object(forKey: "phone") {
            if phone is NSNull {
                phoneNumber = "Unvailable"
            } else {
                phoneNumber = phone as! String
            }
        }
        
        if let correction = infos.object(forKey: "correction_point") {
            correctionPoint = correction as! Int
        }
        
        if let image = infos.object(forKey: "image_url") {
            imageUrl = image as! String
        }
        
        let cursusUser = infos.object(forKey: "cursus_users") as! NSArray
        if cursusUser.count > 0 {
            
//            let test = cursusUser.object(at: index)
//            print(test)
        }
            print("----------")
            print(cursusUser)
            print("----------")
//            skills = (cursusUser as AnyObject).object(forKey: "skills") as! NSArray?
        
//        if let projects_user = infos.object(forKey: "projects_users") as? [[String: Any]] {
//            for project in projects_user {
//                print(project)
//            }
//            print("----------")
//            print(projects_user)
//            print("----------")
//        }

        print(displayName)
        print(login)
        print(email)
        print(location)
        print(phoneNumber)
        print(correctionPoint)
    }
}
