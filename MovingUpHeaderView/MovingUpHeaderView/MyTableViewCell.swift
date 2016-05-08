//
//  MyTableViewCell.swift
//  MovingUpHeaderView
//
//  Created by Khuong Pham on 5/8/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
