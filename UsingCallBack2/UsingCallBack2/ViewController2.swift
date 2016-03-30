//
//  ViewController2.swift
//  UsingCallBack2
//
//  Created by Khuong Pham on 3/30/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var callback: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goBackToViewController(sender: AnyObject) {

        // Download Synchronously
//        let url = NSURL(string: "https://avatars0.githubusercontent.com/u/15992374?v=3&s=200")
//        let data = NSData(contentsOfURL: url!)
//        let image = UIImage(data: data!)

        callback?("https://avatars3.githubusercontent.com/u/11523438?v=3&s=460")
        dismissViewControllerAnimated(true, completion: nil)
    }
}


