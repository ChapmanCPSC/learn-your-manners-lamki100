//
//  EmailViewController.swift
//  LearnYourManners
//
//  Created by Katie on 4/19/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit
import MessageUI

class EmailViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var emailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func sendPressed(sender: AnyObject) {
        
        let message = emailTextView.text!
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let recipient = userDefaults.objectForKey("saved_email") as! String

        // Create email message
        if MFMailComposeViewController.canSendMail()
        {
            let email = MFMailComposeViewController()
            email.mailComposeDelegate = self
            email.setSubject("Learn my manners application!")
            email.setMessageBody(message, isHTML: false)
            email.setToRecipients(["\(recipient)"])
            presentViewController(email, animated: true, completion: nil)
        }
        else
        {
            // pop up box saying invalid email
            // create the alert
            let alert = UIAlertController(title: "Error", message: "Unable to send email.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            // show the alert
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?){
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
