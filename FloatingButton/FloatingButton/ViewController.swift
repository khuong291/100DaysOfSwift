//
//  ViewController.swift
//  FloatingButton
//
//  Created by Khuong Pham on 5/1/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var khuongLabel: UILabel!
    @IBOutlet var khoaLabel: UILabel!

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
        makeLabelsAlphaEqualToZero()
        floatingButtonTopToKhuongBottomConstraint.constant = 0
        khuongTopToKhoaBottomConstraint.constant = 0
    }

    private func makeLabelsAlphaEqualToOne () {
        khuongLabel.alpha = 1
        khoaLabel.alpha = 1
    }

    private func makeLabelsAlphaEqualToZero () {
        khuongLabel.alpha = 0
        khoaLabel.alpha = 0
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

            UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 5, options: .CurveEaseInOut, animations: {
                self.makeLabelsAlphaEqualToOne()
                self.floatingButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
                self.floatingButtonTopToKhuongBottomConstraint.constant += 80
                self.khuongTopToKhoaBottomConstraint.constant += 80
                self.view.layoutIfNeeded()
                }, completion: { _ in
                    self.floatingButtonIsActive = true
            })

        } else {

            UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .CurveEaseInOut, animations: {
                self.khoaView.center.y = self.khuongView.center.y
                self.khoaLabel.alpha = 0
                self.view.layoutIfNeeded()
                }, completion: { _ in
                    UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: .CurveEaseInOut, animations: {
                        self.khuongLabel.alpha = 0
                        self.khuongView.center.y = self.floatingButton.center.y
                        self.khoaView.center.y = self.khuongView.center.y
                        self.view.layoutIfNeeded()
                        }, completion: { _ in
                            UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 5, options: .CurveEaseInOut, animations: {
                                self.floatingButton.transform = CGAffineTransformIdentity
                                }, completion: { _ in
                                    self.floatingButtonTopToKhuongBottomConstraint.constant = 0
                                    self.khuongTopToKhoaBottomConstraint.constant = 0
                                    self.view.layoutIfNeeded()
                                    self.floatingButtonIsActive = false
                                    self.makeKhuongAndKhoaViewHidden()
                            })
                    })
            })

        }
    }
}

