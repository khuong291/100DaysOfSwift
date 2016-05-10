//
//  ViewController.swift
//  UsingCallBack
//
//  Created by Khuong Pham on 3/29/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    var myString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        print(myString)
        button.setTitle(myString, forState: .Normal)
    }
    @IBAction func goToViewController2(sender: AnyObject) {
        let vc2 = storyboard?.instantiateViewControllerWithIdentifier("ViewController2") as! ViewController2
        vc2.callback = ({ string in
            self.myString = string
        })
//        vc2.vc1 = self
        presentViewController(vc2, animated: true, completion: nil)
    }
}

