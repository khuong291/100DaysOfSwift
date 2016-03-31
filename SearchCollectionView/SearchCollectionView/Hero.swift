//
//  Hero.swift
//  SearchCollectionView
//
//  Created by Khuong Pham on 3/31/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import UIKit

class Hero {

    var name: String!
    var image: UIImage? {
        return UIImage(named: "\(name)")!
    }

    required init(name: String) {
        self.name = name
    }
}