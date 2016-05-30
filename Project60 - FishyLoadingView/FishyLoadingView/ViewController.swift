//
//  ViewController.swift
//  FishyLoadingView
//
//  Created by Khuong Pham on 5/29/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sharkImageView: UIImageView!
    @IBOutlet var sharkImageViewCenterXConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(createBubble), userInfo: nil, repeats: true)

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.sharkImageViewCenterXConstraint.constant -= self.view.frame.width / 2
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        moveShark()
    }

    private func moveShark() {
        UIView.animateWithDuration(8, delay: 0.0, options: [.CurveEaseInOut, .Repeat], animations: {
            self.sharkImageViewCenterXConstraint.constant = (self.view.frame.width + 100)
            self.view.layoutIfNeeded()
            }) { _ in
                self.sharkImageViewCenterXConstraint.constant = self.view.frame.width / 2
                self.view.layoutIfNeeded()
        }
    }

    private func swapTwoInts(inout a: CGPoint, inout _ b: CGPoint) {
        let temp = a
        a = b
        b = temp
    }

    private func randomFloatBetween(smallNumber: UInt32, bigNumber: UInt32) -> UInt32 {
        return arc4random_uniform(bigNumber - smallNumber) + smallNumber
    }

    func createBubble() {

        let bubbleImageView = UIImageView(image: UIImage(named: "bubble"))

        let bubbleSize = CGFloat(randomFloatBetween(5, bigNumber: 30))
        bubbleImageView.frame = CGRectMake((sharkImageView.layer.presentationLayer()?.frame.origin.x)! + 5, sharkImageView.layer.presentationLayer()!.frame.origin.y + 80, bubbleSize, bubbleSize)
        view.addSubview(bubbleImageView)

        let zigzagPath = UIBezierPath()
        let oX: CGFloat = bubbleImageView.frame.origin.x
        let oY: CGFloat = bubbleImageView.frame.origin.y
        let eX: CGFloat = oX
        let eY: CGFloat = oY - CGFloat(randomFloatBetween(50, bigNumber: 300))
        let t: CGFloat = CGFloat(randomFloatBetween(20, bigNumber: 100))
        var cp1 = CGPointMake(oX - t, (oY + eY) / 2)
        var cp2 = CGPointMake(oX + t, cp1.y)

        let random = arc4random() % 2
        if random == 1 {
            swapTwoInts(&cp1, &cp2)
        }

        // the moveToPoint method sets the starting point of the line
        zigzagPath.moveToPoint(CGPointMake(oX, oY))
        // add the end point and the control points
        zigzagPath.addCurveToPoint(CGPointMake(eX, eY), controlPoint1: cp1, controlPoint2: cp2)

        CATransaction.begin()
        CATransaction.setCompletionBlock { 
            UIView.animateWithDuration(0.1, delay: 0.0, options: [.TransitionCrossDissolve], animations: { 
                bubbleImageView.transform = CGAffineTransformMakeScale(1.5, 1.5)
                }, completion: { (_) in
                    bubbleImageView.removeFromSuperview()
            })
        }

        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        pathAnimation.duration = 2
        pathAnimation.path = zigzagPath.CGPath
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.removedOnCompletion = false
        bubbleImageView.layer.addAnimation(pathAnimation, forKey: "movingAnimation")

        CATransaction.commit()



//        bubbleImageView.frame = CGRectMake(sharkImageView.frame.origin.x + 5, sharkImageView.frame.origin.y, 15, 15)

    }
}

