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

        createCircleLoadingView()
        createThreeBarsLoadingView()
    }

    private func createThreeBarsLoadingView() {
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.bounds = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        replicatorLayer.position = view.center
        replicatorLayer.backgroundColor = UIColor.clearColor().CGColor
        view.layer.addSublayer(replicatorLayer)

        let bar = CALayer()
        bar.bounds = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 50.0)
        bar.position = CGPoint(x: 35.0, y: 75.0)
        bar.cornerRadius = 2.0
        bar.backgroundColor = UIColor.redColor().CGColor
        
        replicatorLayer.addSublayer(bar)

        let move = CABasicAnimation(keyPath: "position.y")
        move.toValue = bar.position.y - 35.0
        move.duration = 0.5
        move.autoreverses = true
        move.repeatCount = Float.infinity

        bar.addAnimation(move, forKey: nil)

        replicatorLayer.instanceCount = 3
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20.0, 0.0, 0.0)
        replicatorLayer.instanceDelay = 0.33
        replicatorLayer.masksToBounds = true
    }

    private func createCircleLoadingView() {
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = loadingView.bounds

        replicatorLayer.instanceCount = 30
        replicatorLayer.instanceDelay = CFTimeInterval(1 / 50.0)
        replicatorLayer.preservesDepth = false
        replicatorLayer.instanceColor = UIColor.whiteColor().CGColor

        replicatorLayer.instanceRedOffset = -0.5
        replicatorLayer.instanceGreenOffset = 0.5
        replicatorLayer.instanceBlueOffset = -0.5
        replicatorLayer.instanceAlphaOffset = 1.0

        let angle = Float(M_PI * 2.0) / 30
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        loadingView.layer.addSublayer(replicatorLayer)

        let instanceLayer = CALayer()
        let layerWidth: CGFloat = 10.0
        let midX = CGRectGetMidX(loadingView.bounds)
        instanceLayer.frame = CGRect(x: midX, y: 0.0, width: layerWidth, height: layerWidth * 3.0)
        instanceLayer.backgroundColor = UIColor.whiteColor().CGColor
        replicatorLayer.addSublayer(instanceLayer)

        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.0
        fadeAnimation.duration = 1
        fadeAnimation.repeatCount = Float(Int.max)

        instanceLayer.opacity = 0.0
        instanceLayer.addAnimation(fadeAnimation, forKey: "FadeAnimation")

    }

}

