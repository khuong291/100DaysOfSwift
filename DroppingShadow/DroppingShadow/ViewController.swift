//
//  ViewController.swift
//  DroppingShadow
//
//  Created by Khuong Pham on 3/29/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let image1 = stackView.viewWithTag(1) as! UIImageView
        image1.layer.borderColor = UIColor.blueColor().CGColor
        image1.layer.borderWidth = 1
        image1.layer.cornerRadius = 10

        image1.layer.shadowColor = UIColor.blackColor().CGColor
        image1.layer.shadowOffset = CGSize(width: 3, height: 3)
        image1.layer.shadowOpacity = 0.7
        image1.layer.shadowRadius = 4.0
        image1.layer.masksToBounds = false

        let image2 = stackView.viewWithTag(2) as! UIImageView
        image2.layer.borderColor = UIColor.greenColor().CGColor
        image2.layer.borderWidth = 1
        image2.layer.cornerRadius = 2

        image2.layer.shadowColor = UIColor.blackColor().CGColor
        image2.layer.shadowOffset = CGSize(width: 0, height: 0)
        image2.layer.shadowOpacity = 0.5
        image2.layer.shadowRadius = 8.0
        image2.layer.masksToBounds = false

        let image3 = stackView.viewWithTag(3) as! UIImageView
        image3.layer.borderColor = UIColor.orangeColor().CGColor
        image3.layer.borderWidth = 1
        image3.layer.cornerRadius = 20

        image3.layer.shadowColor = UIColor.blackColor().CGColor
        image3.layer.shadowOffset = CGSize(width: 3, height: 0)
        image3.layer.shadowOpacity = 1.0
        image3.layer.shadowRadius = 10.0
        image3.layer.masksToBounds = false

        let image4 = stackView.viewWithTag(4) as! UIImageView
        image4.layer.borderColor = UIColor.redColor().CGColor
        image4.layer.borderWidth = 1
        image4.layer.cornerRadius = 5

        image4.layer.shadowColor = UIColor.blackColor().CGColor
        image4.layer.shadowOffset = CGSize(width: 0, height: 3)
        image4.layer.shadowOpacity = 1.5
        image4.layer.shadowRadius = 3.0
        image4.layer.masksToBounds = false
    }
}

