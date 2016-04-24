//
//  ViewController.swift
//  LearnYourManners
//
//  Created by Katie on 4/12/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mannerTableView: UITableView!
    @IBOutlet weak var sendEmailButton: UIButton!
    
    var lastSelectedIndexPath: Int = -1
    var selectedIndexes: [Int] = []
    
    var manners: [Manner] = [
        EyeContact(),
        GivingCompliments(),
        Sneezing(),
        Restroom(),
        ExcuseMe(),
        Please(),
        Eating(),
        Drinking()
    ]
    
    var mannersChecked : [String:Bool] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mannerTableView.dataSource = self
        self.mannerTableView.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let emailSet = userDefaults.boolForKey("email_set")
        
        if emailSet
        {
            // display send email button
            sendEmailButton.hidden = false
        }
        else
        {
            // otherwise don't display it
            sendEmailButton.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearHistoryPressed(sender: AnyObject) {
        let curCells = mannerTableView.visibleCells
        
        // for each cell it clears the check
        for cell in curCells
        {
            cell.accessoryType = .None
        }
        // remove all from dictionary so dictionary wont check things that are not checked anymore
        mannersChecked.removeAll()
    }
    
    @IBAction func sendEmailPressed(sender: AnyObject) {
        // transition to email page
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let emailVC = storyBoard.instantiateViewControllerWithIdentifier("email_view") as! EmailViewController
        
        // pass through list of manners that have been checked
        var mannersNameCheck: [String] = []
        for (mannerName, mannerChecked) in mannersChecked
        {
            if mannerChecked
            {
                mannersNameCheck.append(mannerName)
            }
        }
        emailVC.mannersVisited = mannersNameCheck
            
        // launch vc
        self.presentViewController(emailVC, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.manners.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let manner = self.manners[indexPath.row]
        
        // create each of the cells
        let cell = UITableViewCell()
        cell.textLabel!.text = manner.name
        
        if (mannersChecked.keys.contains(manner.name))
        {
            cell.accessoryType = .Checkmark
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // check the visited cell
        if indexPath.row != lastSelectedIndexPath
        {
            let newCell = tableView.cellForRowAtIndexPath(indexPath)
            newCell?.accessoryType = .Checkmark
            
            lastSelectedIndexPath = indexPath.row
            
            mannersChecked[(newCell?.textLabel!.text!)!] = true
        }
        
        //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("detail_view") as! UINavigationController
        
        let detailVC = navVC.viewControllers[0] as! MannerDetailedViewController
        //print("\(self.manners[indexPath.row])")
        
        detailVC.manner = self.manners[indexPath.row]
        
        self.presentViewController(navVC, animated: true, completion: nil)
    }

}

