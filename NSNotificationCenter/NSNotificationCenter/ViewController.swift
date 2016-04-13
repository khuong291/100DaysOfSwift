//
//  ViewController.swift
//  NSNotificationCenter
//
//  Created by Khuong Pham on 4/13/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.setName(_:)), name: "forSettingName", object: nil)
    }

    func setName(notification: NSNotification) {
        label.text = "Khuong"
    }

}

