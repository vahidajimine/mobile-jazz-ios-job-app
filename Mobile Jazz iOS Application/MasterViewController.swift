//
//  MasterViewController.swift
//  Mobile Jazz iOS Application
//
//  Created by Vahid Ajimine on 4/27/16.
//  Copyright © 2016 Vahid Ajimine. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, UITextViewDelegate {

    @IBOutlet weak var sendButton: UIBarButtonItem!
    
    var detailViewController: DetailViewController? = nil
    var keyList:[Keys] {
        get {
            var setOfKeys = [Keys]()
            for key in Keys.set {
                setOfKeys.append(key)
            }
            return setOfKeys
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendData(sender: AnyObject) {
        print("Will send data")
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let key = keyList[indexPath.row]
                let object = keyList[indexPath.row].rawValue
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.currentKey = key
                controller.valueNavItem.title = object.uppercaseFirst + " Value"
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        if segue.identifier == "sendData" {
            //TODO: Add custom class for sent data VC
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = keyList[indexPath.row].rawValue.uppercaseFirst
        cell.textLabel!.text = object
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    //MARK: - UITextViewDelegate
    
    func textViewDidEndEditing(textView: UITextView) {
        print(textView.text)
    }
    
    //TODO: Enable Send Button after everything is true

}

