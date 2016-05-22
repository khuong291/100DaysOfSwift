//
//  ViewController.swift
//  CompletionHandler
//
//  Created by Khuong Pham on 5/22/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var downloadButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        addBackgroundImage()

        downloadButton.layer.cornerRadius = downloadButton.frame.width / 2
        downloadButton.layer.borderColor = UIColor.whiteColor().CGColor
        downloadButton.layer.borderWidth = 1
        downloadButton.setTitle("Download\nImages", forState: .Normal)
        downloadButton.titleLabel?.textAlignment = NSTextAlignment.Center
    }

    func addBackgroundImage() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.drawInRect(self.view.bounds)

        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        view.backgroundColor = UIColor(patternImage: image)
    }

    @IBAction func downloadButtonTapped(sender: AnyObject) {

    }

}

