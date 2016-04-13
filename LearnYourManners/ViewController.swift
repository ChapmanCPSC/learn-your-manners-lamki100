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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mannerTableView.dataSource = self
        self.mannerTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.manners.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let manner = self.manners[indexPath.row]
        
        let cell = UITableViewCell()
        cell.textLabel!.text = manner.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row != lastSelectedIndexPath
        {
            let newCell = tableView.cellForRowAtIndexPath(indexPath)
            newCell?.accessoryType = .Checkmark
            
            lastSelectedIndexPath = indexPath.row
        }
        
        //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("detail_view") as! UINavigationController
        
        let detailVC = navVC.viewControllers[0] as! MannerDetailedViewController
        //print("\(self.manners[indexPath.row])")
        
        detailVC.manner = self.manners[indexPath.row]
        
        self.presentViewController(navVC, animated: true, completion: nil)
    }

}

