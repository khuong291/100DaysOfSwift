//
//  ViewController.swift
//  AttributedString
//
//  Created by Khuong Pham on 6/2/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.adjustsFontSizeToFitWidth = true
        label.text = "KHUONG"
        label.font = UIFont.boldSystemFontOfSize(40)
        label.attributedText = attributeText()
    }

    func attributeText() -> NSAttributedString {
        let string = "KHUONG" as NSString
        let result = NSMutableAttributedString(string: string as String)

        let attributesForFirstWord = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(60),
            NSForegroundColorAttributeName: UIColor.redColor(),
            NSBackgroundColorAttributeName: UIColor.blackColor()
        ]

        let shadow = NSShadow()
        shadow.shadowColor = UIColor.darkGrayColor()
        shadow.shadowOffset = CGSize(width: 4, height: 4)

        let attributesForSecondWord = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(50),
            NSForegroundColorAttributeName: UIColor.greenColor(),
            NSBackgroundColorAttributeName: UIColor.yellowColor(),
            NSShadowAttributeName: shadow
        ]

        let attributesForThirdWord = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(40),
            NSForegroundColorAttributeName: UIColor.blueColor(),
            NSBackgroundColorAttributeName: UIColor.orangeColor(),
            NSShadowAttributeName: shadow
        ]

        result.setAttributes(attributesForFirstWord, range: string.rangeOfString("KH"))
        result.setAttributes(attributesForSecondWord, range: string.rangeOfString("UO"))
        result.setAttributes(attributesForThirdWord, range: string.rangeOfString("NG"))

        return NSAttributedString(attributedString: result)
    }
}

