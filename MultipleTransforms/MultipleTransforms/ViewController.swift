//
//  ViewController.swift
//  MultipleTransforms
//
//  Created by Khuong Pham on 3/30/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        var t = CGAffineTransformIdentity
//        t = CGAffineTransformTranslate(t, CGFloat(100), CGFloat(300))
//        t = CGAffineTransformRotate(t, CGFloat(M_PI_4))
//        t = CGAffineTransformScale(t, CGFloat(-1), CGFloat(2))
//        imageView.transform = t
        let rotate = CGAffineTransformMakeRotation(45*CGFloat((M_PI/180)))
        let translate = CGAffineTransformMakeTranslation(UIScreen.mainScreen().bounds.width, -UIScreen.mainScreen().bounds.width / 2)
        UIView.animateWithDuration(5.0) { () -> Void in
            self.imageView.transform = CGAffineTransformConcat(translate, rotate)
        }
    }
}

