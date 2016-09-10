//
//  AvatarImageView.swift
//  Project73 - TwitterUI
//
//  Created by Khuong Pham on 9/10/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class AvatarImageView: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 3.0
    }
}
