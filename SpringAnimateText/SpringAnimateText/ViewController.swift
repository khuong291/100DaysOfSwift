//
//  ViewController.swift
//  SpringAnimateText
//
//  Created by Khuong Pham on 3/24/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myFirstLabel: UILabel!
    var mySecondLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        myFirstLabel = UILabel()
        myFirstLabel.text = "Hello"
        myFirstLabel.font = UIFont.systemFontOfSize(36)
        myFirstLabel.sizeToFit()
        myFirstLabel.center = CGPoint(x: 100, y: 40)
        view.addSubview(myFirstLabel)

        mySecondLabel = UILabel()
        mySecondLabel.text = "I'm Khuong"
        mySecondLabel.font = UIFont.boldSystemFontOfSize(48)
        mySecondLabel.sizeToFit()
        mySecondLabel.center = CGPoint(x: 200, y: 90)
        view.addSubview(mySecondLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

