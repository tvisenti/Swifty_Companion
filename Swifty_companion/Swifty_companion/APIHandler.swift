//
//  APIHandler.swift
//  Swifty_companion
//
//  Created by Thomas VISENTIN on 4/25/17.
//  Copyright © 2017 Thomas VISENTIN. All rights reserved.
//

import Foundation

let CUSTOMER_KEY = "81a5998684273145e7fabb1efe45bcbfc2f2222abf307e456f6a0039cb0f81aa"
let CUSTOMER_SECRET = "0b4cc57b11b5b92f1ac6d3160d2625483671f775fbfe885b74f015b82f2943af"
let API_SITE = "https://api.intra.42.fr"

func getToken() -> NSURL {
    return NSURL(string: API_SITE + "/oauth/token")!
}

let url = NSURL(string: "https://api.intra.42.fr")
let request = NSMutableURLRequest(url: url as! URL)
