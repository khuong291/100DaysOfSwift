//
//  AnimateTableViewCell.swift
//  AnimateTableViewCell
//
//  Created by Khuong Pham on 6/5/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class AnimateTableViewCell: UITableViewCell {

    @IBOutlet var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 5
            containerView.clipsToBounds = true
        }
    }
    @IBOutlet var infoView: UIView! {
        didSet {
            infoView.layer.cornerRadius = 5
            infoView.clipsToBounds = true
        }
    }
    @IBOutlet var coverImageView: UIImageView! {
        didSet {
            coverImageView.layer.cornerRadius = 5
            coverImageView.clipsToBounds = true
        }
    }
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var fromLabel: UILabel!
    @IBOutlet var toLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
