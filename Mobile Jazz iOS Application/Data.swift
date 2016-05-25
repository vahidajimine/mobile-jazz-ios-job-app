//
//  Data.swift
//  Mobile Jazz iOS Application
//
//  Created by Vahid Ajimine on 4/28/16.
//  Copyright © 2016 Vahid Ajimine. All rights reserved.
//

//: Playground - noun: a place where people can play

import UIKit
import Foundation

let sharedDataInstance: RESTData = RESTData.sharedInstance

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

/// Data Singleton `key:value` pair to be sent over a `POST` call
class RESTData {
    /// Singleton instance
    static let sharedInstance = RESTData()
    
    
    
    //MARK: - Property values
    //TODO: Create Struct for these method variables
    var nameValue:String?
    var emailValue:String?
    var aboutValue:String?
    var urlsValue:[String]?
    var teamsValue:[Teams]?
    
    //MARK: - Initializer
    private init () {
        nameValue = nil
        emailValue = nil
        aboutValue = nil
        urlsValue = nil
        teamsValue = nil
    }
    
    var getJSONDict:[String: AnyObject] {
        get {
            var jsonParams:[String: AnyObject] = [:]
            if self.isDataReady {
                for key in Keys.set {
                    switch key {
                        case .name:
                            jsonParams[key.rawValue] = self.nameValue
                        case .email:
                            jsonParams[key.rawValue] = self.emailValue
                        case .about:
                            jsonParams[key.rawValue] = self.aboutValue
                        case .urls:
                            jsonParams[key.rawValue] = self.urlsValue
                        case .teams:
                            jsonParams[key.rawValue] = self.teamsString
                    }
                }
            }
            return jsonParams
        }
    }
    
    //MARK: - Helper methods
    
    /// If all the parameters have been set, then return true. Else returns false.
    var isDataReady:Bool {
        get {
            return self.aboutValue == nil ?
                false : self.emailValue == nil ?
                false : self.nameValue == nil ?
                false : self.teamsValue == nil ?
                false : self.urlsValue == nil ?
                false : self.teamsValue?.count > 0 ?
                false : self.urlsValue?.count > 0 ?
                false : true
        }
    }
    
    private var teamsString: [String]? {
        get {
            if let teamList = self.teamsValue {
                var tempTeams: [String] = []
                for team in teamList {
                    tempTeams.append(team.rawValue)
                }
                return tempTeams
            } else {
                return nil
            }
        }
    }
    //TODO: Add better logic for case by case scenario of nils for the member variable optionals to let user know where they need to add info for the application process
}