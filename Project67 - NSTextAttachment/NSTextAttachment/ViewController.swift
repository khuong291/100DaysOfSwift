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
        let birdString = NSAttributedString(string: "Bird")
        let stringWithBirdImage = NSAttributedString(attributedString: NSAttributedString(attachment: birdAttachment))

        let duckAttachment = NSTextAttachment()
        let duckImage = UIImage(named: "duck")
        duckAttachment.image = duckImage
        let duckString = NSAttributedString(string: "Duck")
        let stringWithDuckImage = NSAttributedString(attributedString: NSAttributedString(attachment: duckAttachment))

        let finalAttributedString = NSMutableAttributedString(string: "")
        finalAttributedString.appendAttributedString(stringWithBirdImage)
        finalAttributedString.appendAttributedString(birdString)
        finalAttributedString.appendAttributedString(stringWithDuckImage)
        finalAttributedString.appendAttributedString(duckString)
        label.attributedText = finalAttributedString
    }

}

