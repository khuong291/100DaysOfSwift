//
//  CircularTransition.swift
//  Project72 - CircularTransition
//
//  Created by Khuong Pham on 9/4/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class CircularTransition: NSObject {

    var circle = UIView()

    var startingPoint = CGPoint.zero {
        didSet {
            circle.center = startingPoint
        }
    }

    var circleColor = UIColor.whiteColor()

    var duration = 0.8

    enum CircularTransitionMode: Int {
        case present, dismiss, pop
    }

    var transitionMode: CircularTransitionMode = .present

}

extension CircularTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()

        if transitionMode == .present {
            if let presentedView = transitionContext.viewForKey(UITransitionContextToViewKey) {
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size

                circle = UIView()

                circle.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)

                circle.layer.cornerRadius = circle.frame.size.height / 2
                circle.center = startingPoint
                circle.backgroundColor = circleColor
                circle.transform = CGAffineTransformMakeScale(0.001, 0.001)
                containerView?.addSubview(circle)

                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransformMakeScale(0.001, 0.001)
                presentedView.alpha = 0
                containerView?.addSubview(presentedView)

                UIView.animateWithDuration(duration, animations: { 
                    self.circle.transform = CGAffineTransformIdentity
                    presentedView.transform = CGAffineTransformIdentity
                    presentedView.alpha = 1
                    presentedView.center = viewCenter
                    }, completion: { (success) in
                        transitionContext.completeTransition(success)
                })
            }
        } else {
            let transitionModeKey = (transitionMode == .pop) ? UITransitionContextToViewKey : UITransitionContextFromViewKey
            if let returningView = transitionContext.viewForKey(transitionModeKey) {
                let viewCenter = returningView.center
                let viewSize = returningView.frame.size

                circle.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                circle.layer.cornerRadius = circle.frame.size.height / 2
                circle.center = startingPoint

                UIView.animateWithDuration(duration, animations: { 
                    self.circle.transform = CGAffineTransformMakeScale(0.001, 0.001)
                    returningView.transform = CGAffineTransformMakeScale(0.001, 0.001)
                    returningView.center = self.startingPoint
                    returningView.alpha = 0

                    if self.transitionMode == .pop {
                        containerView?.insertSubview(returningView, belowSubview: returningView)
                        containerView?.insertSubview(self.circle, belowSubview: returningView)
                    }
                    }, completion: { (success) in
                        returningView.center = viewCenter
                        returningView.removeFromSuperview()
                        self.circle.removeFromSuperview()

                        transitionContext.completeTransition(success)
                })
            }
        }
    }

    func frameForCircle(withViewCenter viewCenter: CGPoint, size viewSize: CGSize, startPoint: CGPoint) -> CGRect {
        let xLength = fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)

        let offestVector = sqrt(xLength * xLength * yLength * yLength) * 2
        let size = CGSize(width: offestVector, height: offestVector)

        return CGRect(origin: CGPoint.zero, size: size)
    }
}
