//
//  DetailViewController.swift
//  Mobile Jazz iOS Application
//
//  Created by Vahid Ajimine on 4/27/16.
//  Copyright © 2016 Vahid Ajimine. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UITextView!
    
    @IBOutlet weak var valueNavItem: UINavigationItem!
    
    var currentKey: Keys? {
        didSet {
            if let key = currentKey {
                switch key {
                case .name:
                    if let data = sharedDataInstance.nameValue {
                        self.detailItem = data
                    } else {
                        self.detailItem = ""
                    }
                case .email:
                    if let data = sharedDataInstance.emailValue {
                        self.detailItem = data
                    } else {
                        self.detailItem = ""
                    }
                case .about:
                    if let data = sharedDataInstance.aboutValue {
                        self.detailItem = data
                    } else {
                        self.detailItem = ""
                    }
                case .urls: 
                    if let data = sharedDataInstance.urlsValue {
                        self.detailItem = data.joinWithSeparator("\n")
                    } else {
                        self.detailItem = ""
                    }
                case .teams: 
                    if let data = sharedDataInstance.teamsString {
                        self.detailItem = data.joinWithSeparator("\n")
                    } else {
                        self.detailItem = ""
                    }
                }
            }
        }
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        self.detailDescriptionLabel.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if let key = self.currentKey {
            self.convertTextToValue(textView.text, key: key)
        }
    }
    
    func convertTextToValue(value: String, key: Keys) {
        switch key {
        case .urls:
            sharedDataInstance.changeParameter(key, value: value.characters.split{$0 == "\n"}.map(String.init) )
        case .teams:
            //TODO: Add checks for each parameter and teams
            sharedDataInstance.changeParameter(key, value: value)
        default:
            sharedDataInstance.changeParameter(key, value: value)
        }
    }
}

