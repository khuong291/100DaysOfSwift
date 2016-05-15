//
//  ViewController.swift
//  PageViewController
//
//  Created by Khuong Pham on 5/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    var page = 0

    var image: UIImage?
    var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        imageView.image = image
        nameLabel.text = name
    }

}

