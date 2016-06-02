//
//  ViewController.swift
//  CAReplicatorLayer
//
//  Created by Khuong Pham on 6/2/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var loadingView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = loadingView.bounds

        // 2
        replicatorLayer.instanceCount = 30
        replicatorLayer.instanceDelay = CFTimeInterval(1 / 50.0)
        replicatorLayer.preservesDepth = false
        replicatorLayer.instanceColor = UIColor.whiteColor().CGColor

        // 3
        replicatorLayer.instanceRedOffset = -0.5
        replicatorLayer.instanceGreenOffset = 0.5
        replicatorLayer.instanceBlueOffset = -0.5
        replicatorLayer.instanceAlphaOffset = 1.0

        // 4
        let angle = Float(M_PI * 2.0) / 30
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        loadingView.layer.addSublayer(replicatorLayer)

        // 5
        let instanceLayer = CALayer()
        let layerWidth: CGFloat = 10.0
        let midX = CGRectGetMidX(loadingView.bounds)
        instanceLayer.frame = CGRect(x: midX, y: 0.0, width: layerWidth, height: layerWidth * 3.0)
        instanceLayer.backgroundColor = UIColor.whiteColor().CGColor
        replicatorLayer.addSublayer(instanceLayer)

        // 6
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.0
        fadeAnimation.duration = 1
        fadeAnimation.repeatCount = Float(Int.max)
        
        // 7
        instanceLayer.opacity = 0.0
        instanceLayer.addAnimation(fadeAnimation, forKey: "FadeAnimation")
    }
}

