//
//  MyTableViewCell.swift
//  ExpandableTableView
//
//  Created by Khuong Pham on 5/14/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var containerView: UIView!
    @IBOutlet var leftView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
