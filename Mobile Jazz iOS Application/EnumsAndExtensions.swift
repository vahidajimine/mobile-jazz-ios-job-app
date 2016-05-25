//
//  EnumsAndExtensions.swift
//  Mobile Jazz iOS Application
//
//  Created by Vahid Ajimine on 5/24/16.
//  Copyright © 2016 Vahid Ajimine. All rights reserved.
//

import Foundation
/**
 List of all the different teams to apply to
 
 - android:  android
 - ios:      ios
 - windows:  windows
 - backend:  backend
 - frontend: frontend
 - design:   design
 */
enum Teams: String {
    case android = "android"
    case ios = "ios"
    case windows = "windows"
    case backend = "backend"
    case frontend = "frontend"
    case design = "design"
}

/** Set of all the keys to be passed in the POST JSON request
 
 name: Your real name as a String
 email: Your e-mail address where we can contact you as a String
 about: Why you think you’re the right person to get the job done, String
 urls: Array of Strings, with URLs describing yourself. You can include as many as you want, like your LinkedIn profile, GitHub, BitBucket, MasterBranch, etc.
 teams: Array of Strings, with one or many teams that apply to teams that you wish to apply for. The values must be amongst the following: android, ios, windows, backend, frontend, design
 */

enum Keys: String {
    case name = "name"
    case email = "email"
    case about = "about"
    case urls = "urls"
    case teams = "teams"
    static let set: Set = [Keys.about, Keys.email, Keys.name, Keys.teams, Keys.urls]
}

// Extend the String class give the ability to uppercase the first string
extension String {
    var first:String {
        get {
            return String(characters.prefix(1))
        }
    }
    var last:String {
        get {
            return String(characters.suffix(1))
        }
    }
    
    var uppercaseFirst:String {
        get {
            return first.uppercaseString + String(characters.dropFirst())
        }
    }
}