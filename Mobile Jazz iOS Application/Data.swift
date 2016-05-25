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
    
    var teamsString: [String]? {
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
    
    func changeParameter (key: Keys, value: AnyObject) {
        switch key {
        case .name:
            sharedDataInstance.nameValue = value as? String
        case .email:
            sharedDataInstance.emailValue = value as? String
        case .about:
            sharedDataInstance.aboutValue = value as? String
        case .urls:
            sharedDataInstance.urlsValue = value as? [String]
        case .teams:
            sharedDataInstance.teamsValue = value as? [Teams]
        }
    }
    //TODO: Add better logic for case by case scenario of nils for the member variable optionals to let user know where they need to add info for the application process
}