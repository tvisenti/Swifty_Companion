//
//  ProjectsUser.swift
//  Swifty_companion
//
//  Created by Thomas Visentin on 29/04/2017.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import SwiftyJSON

class ProjectsUser {
    
    var name : String?
    var mark : Int?
    var status : String?
    var succeed : Bool?
    
    func initProjects(json: JSON) {
        name = json["project"]["name"].stringValue
        mark = json["final_mark"].intValue
        status = json["status"].stringValue
        succeed = json["validated?"].boolValue
    }
}
