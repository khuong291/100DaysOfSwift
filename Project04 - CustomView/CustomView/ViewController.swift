//
//  ViewController.swift
//  CustomView
//
//  Created by Khuong Pham on 3/26/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var messiView: MyCustomView!
    @IBOutlet var ronaldoView: MyCustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func messiButtonTapped(sender: AnyObject) {
        messiView.image = UIImage(named: "messi")
        messiView.nameLabel.text = "Lionel Messi"
    }

    @IBAction func ronaldoButtonTapped(sender: AnyObject) {
        ronaldoView.image = UIImage(named: "ronaldo")
        ronaldoView.nameLabel.text = "Cristiano Ronaldo"
    }
}

