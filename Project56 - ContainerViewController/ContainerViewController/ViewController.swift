//
//  ViewController.swift
//  ContainerViewController
//
//  Created by Khuong Pham on 5/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var codewarsImageView: UIImageView!
    @IBOutlet var stackoverflowImageView: UIImageView!
    @IBOutlet var githubImageView: UIImageView!
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        UIImageView.makeImageCircle(avatarImageView)
        UIImageView.makeImageCircle(githubImageView)
        UIImageView.makeImageCircle(stackoverflowImageView)
        UIImageView.makeImageCircle(codewarsImageView)
    }

}

extension UIImageView {
    class func makeImageCircle(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
    }
}

