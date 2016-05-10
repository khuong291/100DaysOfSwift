//
//  MyCustomView.swift
//  CustomView
//
//  Created by Khuong Pham on 3/26/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class MyCustomView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!

    var name: String? {
        get {
            return nameLabel.text
        }
        set {
            nameLabel.text = newValue
        }
    }

    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }

    required override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    func initSubviews() {
        let nib = UINib(nibName: "MyCustomView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        print("hello")
    }
}
