//
//  UserInfo.swift
//  Swifty_companion
//
//  Created by Thomas VISENTIN on 4/26/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserInfo {
    
    static let sharedInstance = UserInfo()
    
    var displayName : String?
    var login : String?
    var email : String?
    var location : String?
    var phoneNumber : String?
    var correctionPoint : Int?
    var imageUrl : String?
    var level : Float?
    var skills = [SkillsUser]()
    var projects = [ProjectsUser]()
    var isStudent : Bool?
    
    
    func initUserInfo(json: JSON) {
        displayName = json["displayname"].stringValue
        login = json["login"].stringValue
        email = json["email"].stringValue
        location = json["location"].stringValue
        phoneNumber = json["phone"].stringValue
        correctionPoint = json["correction_point"].intValue
        imageUrl = json["image"].stringValue
        
        if let cursus = json["cursus_users"].array {
            for entry in cursus {
                let cursus_name = entry["cursus"]["slug"].stringValue
                if cursus_name == "42" {
                    isStudent = true
                    if let skls = entry["skills"].array {
                        for skill in skls {
                            self.skills.append(SkillsUser(json: skill))
                        }
                    }
                }
            }
        }
        
        if let cursus = json["projects_users"].array {
            for entry in cursus {
                let cursus_name = entry["cursus"]["slug"].stringValue
                if cursus_name == "42" {
                    if let prjs = entry["projects"].array {
                        for project in prjs {
                            self.projects.append(ProjectsUser(json: project))
                        }
                    }
                    level = entry["level"].floatValue
                }
            }
        }
    }
}
