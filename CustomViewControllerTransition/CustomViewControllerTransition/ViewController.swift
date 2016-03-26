//
//  ViewController.swift
//  CustomViewControllerTransition
//
//  Created by Khuong Pham on 3/26/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet var imageView: UIImageView!
    var isPresenting = true
    var interactiveTransition: UIPercentDrivenInteractiveTransition!

    override func viewDidLoad() {
        super.viewDidLoad()

        interactiveTransition = UIPercentDrivenInteractiveTransition()

        let pinchGesture = UIPinchGestureRecognizer(target: self, action: "onPinch:")
        view.addGestureRecognizer(pinchGesture)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.0
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        print("animating transition")
        let containerView = transitionContext.containerView()
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)

        if isPresenting {
            containerView?.addSubview((toViewController?.view)!)
            toViewController?.view.alpha = 0
            toViewController?.view.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                toViewController?.view.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
                toViewController!.view.alpha = 1.0
                }, completion: { (_) -> Void in
                    transitionContext.completeTransition(true)
            })
        } else {
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                fromViewController!.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController!.view.removeFromSuperview()
            }
        }
    }

    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        interactiveTransition.completionSpeed = 0.99
        return interactiveTransition
    }

    func onPinch(sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        let velocity = sender.velocity
        if sender.state == UIGestureRecognizerState.Began {
            performSegueWithIdentifier("mySegue", sender: self)
        } else if sender.state == UIGestureRecognizerState.Changed {
            //We are dividing by 7 here since updateInteractiveTransition expects a number between 0 and 1
            interactiveTransition.updateInteractiveTransition(scale / 7)
        } else if sender.state == UIGestureRecognizerState.Ended {
            if velocity > 0 {
                interactiveTransition.finishInteractiveTransition()
            } else {
                interactiveTransition.cancelInteractiveTransition()
            }
        }
    }
}

