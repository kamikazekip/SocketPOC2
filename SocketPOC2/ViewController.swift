//
//  ViewController.swift
//  SocketPOC2
//
//  Created by User on 04/03/15.
//  Copyright (c) 2015 42IN11SOf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!

    var keyboardOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomConstraint.constant = 1
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name:
            UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardClosing:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWasShown(notification: NSNotification) {
        keyboardOpen = true
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.bottomConstraint.constant = keyboardFrame.size.height
        })
    }
    
    func keyboardClosing(notification: NSNotification) {
        keyboardOpen = false
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.bottomConstraint.constant = 0
        })
    }
    
    @IBAction func TapMainScreen(sender: UITapGestureRecognizer) {
        if(keyboardOpen){
           self.view.endEditing(true);
        }
    }
    
    @IBAction func sendMessage(sender: UIBarButtonItem) {
        if(textField.text != ""){
            println("Send: " + textField.text);
        }
    }
    
}

