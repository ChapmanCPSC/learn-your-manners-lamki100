//
//  SettingsViewController.swift
//  LearnYourManners
//
//  Created by Katie on 4/19/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var emailTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // fill text box if already type in email
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let emailFilled = userDefaults.boolForKey("email_set")
        
        if emailFilled
        {
            let email = userDefaults.objectForKey("saved_email") as! String
            emailTextBox.text = email
        }
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SettingsViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func donePressed(sender: AnyObject) {
        
        // take email address and see if its an email
        // TODO
        let email = emailTextBox.text!
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if (isValidEmail(email))
        {
            // save email address
            userDefaults.setObject(email, forKey: "saved_email")
            userDefaults.setBool(true, forKey: "email_set")
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else if email == ""
        {
            // save nothing
            userDefaults.setObject("", forKey: "saved_email")
            userDefaults.setBool(false, forKey: "email_set")
            
            // just leave the page
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else
        {
            // pop up box saying invalid email
            // create the alert
            let alert = UIAlertController(title: "Error", message: "Invalid email. Please enter a valid email.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            // show the alert
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    // reference http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
    func isValidEmail(potentialEmail: String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTester = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTester.evaluateWithObject(potentialEmail)
    }
}
