//
//  ViewController.swift
//  SpringAnimateText
//
//  Created by Khuong Pham on 3/24/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: UIButtonType.System) as UIButton
        button.bounds = CGRect(x: 0, y: 0, width: 250, height: 30)
        button.center = view.center
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Please, DONT CLICK HERE!!", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)

        self.view.addSubview(button)
    }

    func buttonAction(button: UIButton) {
        let myFirstLabel = UILabel()
        myFirstLabel.text = "Hello"
        myFirstLabel.font = UIFont.systemFontOfSize(36)
        myFirstLabel.sizeToFit()
        myFirstLabel.center = CGPoint(x: 100, y: 40)
        view.addSubview(myFirstLabel)

        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            myFirstLabel.center = CGPoint(x: 100, y: 40 + 200)
            }, completion: nil)

        let mySecondLabel = UILabel()
        mySecondLabel.text = "I'm Khuong"
        mySecondLabel.font = UIFont.boldSystemFontOfSize(48)
        mySecondLabel.sizeToFit()
        mySecondLabel.center = CGPoint(x: 200, y: 90)
        mySecondLabel.alpha = 0.0
        view.addSubview(mySecondLabel)

        UIView.animateWithDuration(3.0, delay: 1.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            mySecondLabel.center = CGPoint(x: 200, y: 90 + 200)
            mySecondLabel.alpha = 1
            }) {(_) -> Void in
                button.alpha = 0.0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

