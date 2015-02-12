//
//  ViewController.swift
//  Swift-iOS-FacebookPost
//
//  Created by Rudi Luis on 12/02/15.
//  Copyright (c) 2015 Rudi Luis. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var textView: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPost(sender: UIButton) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            var facebookSheet = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            facebookSheet.setInitialText(textView.text)
            facebookSheet.addImage(imageView?.image)
            
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "Information", message: "None account active! Definitions -> Facebook and try again!", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            
            alert.addAction(UIAlertAction(title: "Close", style: .Default, handler: { action in
                switch action.style{
                case .Default:
                    print("closed")
                    
                case .Cancel:
                    println("cancel")
                    
                case .Destructive:
                    println("destructive")
                }
            }))
            alert.addAction(UIAlertAction(title: "Help", style: .Default, handler: { action in
                switch action.style{
                case .Default:
                    let url : NSURL = NSURL(string: "https://github.com/rudiluis/Swift-iOS-AddContact/blob/master/README.md")!
                    UIApplication.sharedApplication().openURL(url);
                    
                case .Cancel:
                    println("cancel")
                    
                case .Destructive:
                    println("destructive")
                }
            }))
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

