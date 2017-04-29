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
    
    var name : String!
    var mark : Int!
    var status : String!
    var succeed : Bool!
    
    required init (json: JSON) {
        name = json["slug"].stringValue
        mark = json["final_mark"].intValue
        status = json["validated"].stringValue
        succeed = json["validated?"].boolValue
    }
}
