//
//  ViewController.swift
//  CallingAnimation
//
//  Created by Khuong Pham on 5/29/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var view3: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view1: UIView!
    @IBOutlet var button: UIButton!

    var buttonIsTapped = false
    let callImage = UIImage(named: "call")

    override func viewDidLoad() {
        super.viewDidLoad()

        makeViewCircle(view1)
        makeViewCircle(view2)
        makeViewCircle(view3)
    }

    private func makeViewCircle(view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2
        view.clipsToBounds = true
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        UIView.animateWithDuration(3.0, delay: 0.0, options: [.CurveEaseInOut, .Repeat], animations: { 
            self.view3.transform = CGAffineTransformMakeScale(6.0, 6.0)
            self.view3.alpha = 0.0
            }, completion: { _ in
                self.view3.transform = CGAffineTransformIdentity
                self.view3.alpha = 1.0
        })

        UIView.animateWithDuration(3.0, delay: 0.3, options: [.CurveEaseInOut, .Repeat], animations: {
            self.view2.transform = CGAffineTransformMakeScale(6.0, 6.0)
            self.view2.alpha = 0.0
            }, completion: { _ in
                self.view2.transform = CGAffineTransformIdentity
                self.view2.alpha = 1.0
        })

        UIView.animateWithDuration(3.0, delay: 0.6, options: [.CurveEaseInOut, .Repeat], animations: {
            self.view1.transform = CGAffineTransformMakeScale(6.0, 6.0)
            self.view1.alpha = 0.0
            }, completion: { _ in
                self.view1.transform = CGAffineTransformIdentity
                self.view1.alpha = 1.0
        })
    }
    
}

