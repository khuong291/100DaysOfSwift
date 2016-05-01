//
//  ViewController.swift
//  FloatingButton
//
//  Created by Khuong Pham on 5/1/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var floatingButton: UIImageView!
    var floatingButtonIsActive = false

    override func viewDidLoad() {
        super.viewDidLoad()

        addShadowToFloatingButton()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(floatingButtonTapped(_:)))
        floatingButton.addGestureRecognizer(gesture)
    }

    private func addShadowToFloatingButton() {
        floatingButton.layer.shadowColor = UIColor.grayColor().CGColor
        floatingButton.layer.shadowOffset = CGSize(width: -2, height: 2)
        floatingButton.layer.shadowOpacity = 1
        floatingButton.layer.shadowRadius = 1
    }

    func floatingButtonTapped(sender: UITapGestureRecognizer) {

        if floatingButtonIsActive == false {

            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .CurveEaseInOut, animations: {
                self.floatingButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
                }, completion: { _ in
                    self.floatingButtonIsActive = true
            })

        } else {
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .CurveEaseInOut, animations: {
                self.floatingButton.transform = CGAffineTransformIdentity
                }, completion: { _ in
                    self.floatingButtonIsActive = false
            })
        }
    }
}

