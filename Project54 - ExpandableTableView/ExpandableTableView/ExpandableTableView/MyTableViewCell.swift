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
    @IBOutlet var detailView: DetailView!

    class var expandedHeight: CGFloat { get { return 450 } }

    class var defaultHeight: CGFloat { get { return 200 } }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        leftView.layer.cornerRadius = 10
        leftView.clipsToBounds = true
        detailView.layer.cornerRadius = 10
        detailView.clipsToBounds = true
    }

    func checkHeight() {
        detailView.hidden = frame.size.height < MyTableViewCell.expandedHeight
    }

    func watchFrameChange() {
        addObserver(self, forKeyPath: "frame", options: .New, context: nil)
        checkHeight()
    }

    func ignoreFrameChange() {
        removeObserver(self, forKeyPath: "frame")
    }

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "frame" {
            checkHeight()
        }
    }

}
