//
//  SkillsUser.swift
//  Swifty_companion
//
//  Created by Thomas Visentin on 29/04/2017.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation
import SwiftyJSON

class SkillsUser {
    
    var name : String?
    var level : Float?
    
    func initSkill(json: JSON) {
        name = json["name"].stringValue
        level = json["level"].floatValue
    }
}
