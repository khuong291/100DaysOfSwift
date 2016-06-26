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

        let imageSize = CGSize(width: 20, height: 20)

        let finalAttributedString = NSMutableAttributedString(string: "")

        let birdStringAttributes = [
            NSForegroundColorAttributeName: UIColor.greenColor(),
            NSBackgroundColorAttributeName: UIColor.blueColor(),
            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleDouble.rawValue,
            NSFontAttributeName: UIFont.systemFontOfSize(19.0)
        ]

        finalAttributedString.appendAttributedString(stringForAttachment(named: "bird", imageSize: imageSize, caption: "Something really amazing happened in Downtown Spokane this week and I had to share the story with you. Some of you may know that my brother, Joel, is a loan officer at Sterling Bank. He works downtown in a second story office building, overlooking busy Riverside Avenue.", stringAttributes: birdStringAttributes))

        let duckStringAttributes = [
            NSForegroundColorAttributeName: UIColor.orangeColor(),
            NSBackgroundColorAttributeName: UIColor.blueColor(),
            NSFontAttributeName: UIFont.systemFontOfSize(14.0)
        ]

        finalAttributedString.appendAttributedString(stringForAttachment(named: "duck", imageSize: imageSize, caption: "Several weeks ago he watched a mother duck choose the cement awning outside his window as the uncanny place to build a nest above the sidewalk.The mallard laid ten eggs in a nest in the corner of the planter that is perched over 10 feet in the air. She dutifully kept the eggs warm for weeks and Monday afternoon all of her ten ducklings hatched.", stringAttributes: duckStringAttributes))

        label.attributedText = finalAttributedString
    }

    private func stringForAttachment(named imageName: String, imageSize: CGSize, caption: String, stringAttributes: [String : AnyObject]) -> NSAttributedString {
        let attachment = NSTextAttachment()
        let image = UIImage(named: imageName)
        attachment.image = image
        attachment.bounds.size = imageSize
        let fullString = NSMutableAttributedString(string: "")
        fullString.appendAttributedString(NSAttributedString(attachment: attachment))
        fullString.appendAttributedString(NSAttributedString(string: caption, attributes: stringAttributes))
        return fullString
    }

}

