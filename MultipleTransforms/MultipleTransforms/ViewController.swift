//
//  ViewController.swift
//  MultipleTransforms
//
//  Created by Khuong Pham on 3/30/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let kRotationAnimationKey = "com.myapplication.rotationanimationkey"

        func rotateView(view: UIView, duration: Double = 1) {
            if view.layer.animationForKey(kRotationAnimationKey) == nil {
                let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")

                rotationAnimation.fromValue = 0.0
                rotationAnimation.toValue = Float(M_PI * 2.0)
                rotationAnimation.duration = duration
                rotationAnimation.repeatCount = Float.infinity

                view.layer.addAnimation(rotationAnimation, forKey: kRotationAnimationKey)
            }
        }

        func stopRotatingView(view: UIView) {
            if view.layer.animationForKey(kRotationAnimationKey) != nil {
                view.layer.removeAnimationForKey(kRotationAnimationKey)
            }
        }

        var transform = CGAffineTransformMakeTranslation(UIScreen.mainScreen().bounds.width - 200, 0)
        transform = CGAffineTransformScale(transform, 3.0, 3.0)
        UIView.animateWithDuration(1.0, delay: 0, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: { () -> Void in
            self.imageView.transform = transform
            rotateView(self.imageView)
            self.view.layoutIfNeeded()
            }) { (_) -> Void in
               stopRotatingView(self.imageView)
        }
    }
    
}

