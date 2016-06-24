//
//  ViewController.swift
//  NSTextAttachment
//
//  Created by Khuong Pham on 6/24/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let birdAttachment = NSTextAttachment()
        let birdImage = UIImage(named:"bird")
        birdAttachment.image = birdImage
        let birdString = NSMutableAttributedString(string: "Bird")
        let stringWithBirdImage = NSMutableAttributedString(attributedString: NSAttributedString(attachment: birdAttachment))
        stringWithBirdImage.appendAttributedString(birdString)

        let duckAttachment = NSTextAttachment()
        let duckImage = UIImage(named: "duck")
        duckAttachment.image = duckImage
        let duckString = NSMutableAttributedString(string: "Duck")
        let stringWithDuckImage = NSMutableAttributedString(attributedString: NSAttributedString(attachment: duckAttachment))
        stringWithDuckImage.appendAttributedString(duckString)
        stringWithBirdImage.appendAttributedString(stringWithDuckImage)
        label.attributedText = stringWithBirdImage
    }

}

