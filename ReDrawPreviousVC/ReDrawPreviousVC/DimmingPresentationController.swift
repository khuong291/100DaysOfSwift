//
//  DimmingPresentationController.swift
//  ReDrawPreviousVC
//
//  Created by Khuong Pham on 4/14/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import UIKit

class DimmingPresentationController: UIPresentationController {

    override func shouldRemovePresentersView() -> Bool {
        return false
    }
}

