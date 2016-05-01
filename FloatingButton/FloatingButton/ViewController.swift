//
//  ViewController.swift
//  FloatingButton
//
//  Created by Khuong Pham on 5/1/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var floatingButtonTopToKhuongBottomConstraint: NSLayoutConstraint!
    @IBOutlet var khuongTopToKhoaBottomConstraint: NSLayoutConstraint!

    @IBOutlet var khoaImageView: UIImageView!
    @IBOutlet var khuongImageView: UIImageView!
    @IBOutlet var khuongView: UIView!
    @IBOutlet var khoaView: UIView!

    @IBOutlet var floatingButton: UIImageView!
    var floatingButtonIsActive = false

    override func viewDidLoad() {
        super.viewDidLoad()

        addShadowToFloatingButton()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(floatingButtonTapped(_:)))
        floatingButton.addGestureRecognizer(gesture)
        makeCircleImages()
        makeKhuongAndKhoaViewHidden()
        floatingButtonTopToKhuongBottomConstraint.constant = 0
        khuongTopToKhoaBottomConstraint.constant = 0
    }

    private func makeKhuongAndKhoaViewHidden() {
        khoaView.hidden = true
        khuongView.hidden = true
    }

    private func makeKhuongAndKhoaViewAppeared() {
        khoaView.hidden = false
        khuongView.hidden = false
    }

    private func makeCircleImages() {
        khuongImageView.layer.cornerRadius = khuongImageView.frame.width / 2
        khuongImageView.clipsToBounds = true
        khoaImageView.layer.cornerRadius = khoaImageView.frame.width / 2
        khoaImageView.clipsToBounds = true
    }

    private func addShadowToFloatingButton() {
        floatingButton.layer.shadowColor = UIColor.grayColor().CGColor
        floatingButton.layer.shadowOffset = CGSize(width: -2, height: 2)
        floatingButton.layer.shadowOpacity = 1
        floatingButton.layer.shadowRadius = 1
    }

    func floatingButtonTapped(sender: UITapGestureRecognizer) {

        if floatingButtonIsActive == false {
            makeKhuongAndKhoaViewAppeared()

            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .CurveEaseInOut, animations: {
                self.floatingButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
                self.floatingButtonTopToKhuongBottomConstraint.constant = 30
                self.khuongTopToKhoaBottomConstraint.constant = 30
                self.view.layoutIfNeeded()
                }, completion: { _ in
                    self.floatingButtonIsActive = true
            })

        } else {
            makeKhuongAndKhoaViewHidden()
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .CurveEaseInOut, animations: {
                self.floatingButton.transform = CGAffineTransformIdentity
                self.floatingButtonTopToKhuongBottomConstraint.constant = 0
                self.khuongTopToKhoaBottomConstraint.constant = 0
                self.view.layoutIfNeeded()
                }, completion: { _ in
                    self.floatingButtonIsActive = false
            })
        }
    }
}

