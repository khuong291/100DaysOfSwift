//
//  ViewController2.swift
//  UsingCallBack
//
//  Created by Khuong Pham on 3/29/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var textField: UITextField!
//    var vc1: ViewController?
    var callback: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backToViewController(sender: AnyObject) {
//        vc1?.myString = textField.text!
        callback?(textField.text!)
        dismissViewControllerAnimated(true, completion: nil)
    }
}
