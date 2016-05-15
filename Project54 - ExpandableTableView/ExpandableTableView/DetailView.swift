//
//  DetailView.swift
//  ExpandableTableView
//
//  Created by Khuong Pham on 5/14/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class DetailView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet var detailView: UIView!
    @IBOutlet var sendRequestButton: UIButton!

    required override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    func initSubviews() {
        let nib = UINib(nibName: "DetailView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)

        detailView.layer.cornerRadius = 10
        detailView.clipsToBounds = true
        sendRequestButton.layer.cornerRadius = 10

        contentView.frame = bounds
        addSubview(contentView)
    }
}
