//
//  MannerDetailedViewController.swift
//  LearnYourManners
//
//  Created by Katie on 4/12/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class MannerDetailedViewController: UIViewController {
    
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var manner : Manner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // show image
        displayImageView.image = UIImage(named: self.manner.image)
        displayImageView.contentMode = .ScaleAspectFit
        
        // show description
        descriptionTextView.text = self.manner.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

