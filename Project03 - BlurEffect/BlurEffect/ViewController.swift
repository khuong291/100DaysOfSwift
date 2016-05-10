//
//  ViewController.swift
//  BlurEffect
//
//  Created by Khuong Pham on 3/25/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var segmentedControl: UISegmentedControl!

    var blurEffect = UIBlurEffect()
    var blurView = UIVisualEffectView()

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 3
    }

    @IBAction func segmentChanged(segment: UISegmentedControl) {

        switch segmentedControl.selectedSegmentIndex {
        case 0:
            blurEffect = UIBlurEffect(style: .Dark)
            blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = imageView.bounds
            imageView.addSubview(blurView)
        case 1:
            blurEffect = UIBlurEffect(style: .ExtraLight)
            blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = imageView.bounds
            imageView.addSubview(blurView)
        case 2:
            blurEffect = UIBlurEffect(style: .Light)
            blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = imageView.bounds
            imageView.addSubview(blurView)
        case 3: imageView.subviews.forEach{ $0.removeFromSuperview() }
        default: break
        }

    }
}

