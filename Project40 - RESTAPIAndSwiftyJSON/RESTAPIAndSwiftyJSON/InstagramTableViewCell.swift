//
//  InstagramTableViewCell.swift
//  RESTAPIAndSwiftyJSON
//
//  Created by Khuong Pham on 3/29/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class InstagramTableViewCell: UITableViewCell {

    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!

    override func awakeFromNib() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.clipsToBounds = true
    }
}
