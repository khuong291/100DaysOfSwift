//
//  ViewController2.swift
//  NSNotificationCenter
//
//  Created by Khuong Pham on 4/13/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//


import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func setNameButtonTapped(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("forSettingName", object: nil)
    }
}
