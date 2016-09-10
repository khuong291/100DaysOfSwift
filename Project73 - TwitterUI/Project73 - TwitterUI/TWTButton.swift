//
//  TWTButton.swift
//  Project73 - TwitterUI
//
//  Created by Khuong Pham on 9/10/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class TWTButton: UIButton {

    override func awakeFromNib() {

        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(red: 85.0/255.0, green: 172.0/255.0, blue: 238.0/255.0, alpha: 1.0).CGColor

    }
    
}
