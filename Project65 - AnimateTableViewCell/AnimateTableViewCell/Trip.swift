//
//  Trip.swift
//  AnimateTableViewCell
//
//  Created by Khuong Pham on 6/5/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class Trip {
    var placeName: String!
    var price: String!
    var fromDate: String!
    var toDate: String!
    var coverImage: UIImage!

    init(placeName: String, price: String, fromDate: String, toDate: String, coverImage: UIImage) {
        self.placeName = placeName
        self.price = price
        self.fromDate = fromDate
        self.toDate = toDate
        self.coverImage = coverImage
    }
}
