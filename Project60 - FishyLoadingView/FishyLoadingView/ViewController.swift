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

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(createBubble))
        sharkImageView.userInteractionEnabled = true
        sharkImageView.addGestureRecognizer(tapGesture)

        moveShark()

    }

    func moveShark() {
//        UIView.animateWithDuration(5, delay: 0.0, options: [.CurveEaseInOut, .Repeat], animations: { 
//            self.sharkImageView.frame.po = CGRect(x: self.view.frame.size.width + 200, y: self.view.center.y - 100, width: 200, height: 200)
//            }) { _ in
//                self.sharkImageView.frame = CGRect(x: self.view.frame.origin.x - 200, y: self.view.center.y - 100, width: 200, height: 200)
//                self.moveShark()
//        }
    }

    func createBubble() {

        let bubbleImageView = UIImageView(image: UIImage(named: "bubble"))
        bubbleImageView.frame = CGRectMake(sharkImageView.frame.width / 2, sharkImageView.frame.origin.y, 20, 20)
        view.addSubview(bubbleImageView)

        let zigzagPath = UIBezierPath()
        let oX: CGFloat = bubbleImageView.frame.origin.x
        let oY: CGFloat = bubbleImageView.frame.origin.y
        let eX: CGFloat = oX
        let eY: CGFloat = oY - 200
        let t: CGFloat = 40
        var cp1 = CGPointMake(oX - t, (oY + eY) / 2)
        var cp2 = CGPointMake(oX + t, cp1.y)
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

//        let random = arc4random() % 2
//        if random == 1 {
//            let temp = cp1
//            cp1 = cp2
//            cp2 = temp
//        }

//        bubbleImageView.frame = CGRectMake(sharkImageView.frame.origin.x + 5, sharkImageView.frame.origin.y, 15, 15)

    }

//    private func randomFloatBetween(smallNumber: Float, bigNumber: Float) {
//        let diff = bigNumber - smallNumber
//        return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
//        return arc4random() % (()
//    }
}

