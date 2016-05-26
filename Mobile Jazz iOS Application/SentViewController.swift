//
//  SentViewController.swift
//  Mobile Jazz iOS Application
//
//  Created by Vahid Ajimine on 5/25/16.
//  Copyright © 2016 Vahid Ajimine. All rights reserved.
//

import Foundation
import UIKit
class SentViewController: UIViewController, RESTControllerProtocol {
    
    @IBOutlet weak var resultTextView: UITextView!
    var serverCall: RESTController!
    
    var resultText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultText = ""
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.serverCall = RESTController(delegate: self)
        //print (sharedDataInstance.getJSONDict)
        self.serverCall.restCall(sharedDataInstance.getJSONDict, url: "https://mobilejazz.com/jobs/apply")
    }
    
    func didReceiveAPIResults(results: [String : AnyObject]!, url: String) {
        self.resultText = "Data was successfully sent with response:\n\n"
        self.resultText += String(results)
        self.resultTextView.text = self.resultText
        self.resultTextView.scrollEnabled = !self.resultTextView.scrollEnabled
        self.resultTextView.scrollEnabled = !self.resultTextView.scrollEnabled
    }
    
    func didNotReceiveAPIResults(error: String, url: String) {
        self.resultText = "Data sent had an error:\n\n"
        self.resultText = error
        self.resultTextView.text = self.resultText
        self.resultTextView.scrollEnabled = !self.resultTextView.scrollEnabled
        self.resultTextView.scrollEnabled = !self.resultTextView.scrollEnabled
    }
}