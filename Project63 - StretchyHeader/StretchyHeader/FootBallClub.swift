//
//  FootBallClub.swift
//  StretchyHeader
//
//  Created by Khuong Pham on 6/3/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class FootBallClub {
    var fcName: String!
    var fcLogoImage: UIImage!
    var fcNameColor: UIColor!

    init(fcName: String, fcLogoImage: UIImage, fcNameColor: UIColor) {
        self.fcName = fcName
        self.fcLogoImage = fcLogoImage
        self.fcNameColor = fcNameColor
    }
}
