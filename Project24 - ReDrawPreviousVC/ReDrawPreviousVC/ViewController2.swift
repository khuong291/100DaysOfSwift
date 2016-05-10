//
//  ViewController2.swift
//  ReDrawPreviousVC
//
//  Created by Khuong Pham on 4/14/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.alpha = 0.5
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }

    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}
