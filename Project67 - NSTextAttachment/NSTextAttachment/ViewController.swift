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
        birdAttachment.bounds.size = CGSize(width: 20, height: 20)
        birdAttachment.image = birdImage
        let birdString = NSAttributedString(string: "Something really amazing happened in Downtown Spokane this week and I had to share the story with you. Some of you may know that my brother, Joel, is a loan officer at Sterling Bank. He works downtown in a second story office building, overlooking busy Riverside Avenue.")
        let stringWithBirdImage = NSAttributedString(attributedString: NSAttributedString(attachment: birdAttachment))

        let duckAttachment = NSTextAttachment()
        let duckImage = UIImage(named: "duck")
        duckAttachment.image = duckImage
        duckAttachment.bounds.size = CGSize(width: 20, height: 20)
        let duckString = NSAttributedString(string: "Several weeks ago he watched a mother duck choose the cement awning outside his window as the uncanny place to build a nest above the sidewalk.The mallard laid ten eggs in a nest in the corner of the planter that is perched over 10 feet in the air. She dutifully kept the eggs warm for weeks and Monday afternoon all of her ten ducklings hatched.")
        let stringWithDuckImage = NSAttributedString(attributedString: NSAttributedString(attachment: duckAttachment))

        let finalAttributedString = NSMutableAttributedString(string: "")
        finalAttributedString.appendAttributedString(stringWithBirdImage)
        finalAttributedString.appendAttributedString(birdString)
        finalAttributedString.appendAttributedString(stringWithDuckImage)
        finalAttributedString.appendAttributedString(duckString)
        label.attributedText = finalAttributedString
    }

}

