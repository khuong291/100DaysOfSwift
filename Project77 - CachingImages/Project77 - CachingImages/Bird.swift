//
//  Bird.swift
//  Project77 - CachingImages
//
//  Created by Khuong Pham on 9/20/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

struct Bird {
    var id: String!
    var name: String!
    var image: String!

    init() {
        id = ""
        name = ""
        image = ""
    }

    init(jsonDict: [String : AnyObject]) {
        guard let id = jsonDict["idChim"] as? String, name = jsonDict["tenChim"] as? String, image = jsonDict["hinhChim"] as? String else { return }
        self.id = id
        self.name = name
        self.image = image
    }
}
