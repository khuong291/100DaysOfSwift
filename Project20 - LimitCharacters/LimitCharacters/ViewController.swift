//
//  ViewController.swift
//  LimitCharacters
//
//  Created by Khuong Pham on 4/20/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var label2: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField1: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        textField1.delegate = self
        textField2.delegate = self
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        if textField == textField1 {
            label1.text = "\(10 - textField1.text!.characters.count)"

            if range.length > 10 {
                return false
            }

            let newLength = textField1.text!.characters.count + range.length

            return newLength < 10

        } else if textField == textField2 {
            label2.text = "\(8 - textField2.text!.characters.count)"

            if range.length > 8 {
                return false
            }

            let newLength = textField2.text!.characters.count + range.length
            
            return newLength < 8
        }
        return true
    }
    
}

