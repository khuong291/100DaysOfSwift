//
//  ViewController.swift
//  MovingUpHeaderView
//
//  Created by Khuong Pham on 5/3/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var contentViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var contentViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var actionLabel: UILabel!
    var originHeaderViewHeight: CGFloat = 0.0
    var originContentViewWidth: CGFloat = 0.0

    let threshold = 1000.0

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        tableView.tableHeaderView = headerView
        contentView.layer.cornerRadius = 10
        actionLabel.layer.cornerRadius = 10
        actionLabel.clipsToBounds = true
        originHeaderViewHeight = headerView.bounds.height
        originContentViewWidth = contentView.bounds.width

    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyTableViewCell
        cell.myImageView.image = UIImage(named: "1")
        cell.myLabel.text = "Test"
        return cell
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if Double(maximumOffset - contentOffset) <= threshold {
            dispatch_async(dispatch_get_main_queue()) {
                UIView.animateWithDuration(0.4, delay: 0.0, options: [.CurveEaseInOut], animations: {
                    self.navigationItem.leftBarButtonItem!.title = "*8951"
                    self.navigationItem.rightBarButtonItem!.title = "$1450"
                    self.title = "MY DEBIT CARD"
                    self.contentViewTrailingConstraint.constant = 0
                    self.contentViewLeadingConstraint.constant = 0
                    self.headerView.frame.size.height = 0
                    self.headerView.alpha = 0
                    self.view.layoutIfNeeded()
                    }, completion: { (_) in
                        self.navigationController?.navigationBar.barTintColor = self.contentView.backgroundColor
                })
            }
        }
        else {
            dispatch_async(dispatch_get_main_queue()) {
                UIView.animateWithDuration(0.4, delay: 0.0, options: [.CurveEaseInOut], animations: {
                    self.navigationItem.leftBarButtonItem!.title = "ATM"
                    self.navigationItem.rightBarButtonItem!.title = "NEW CARD"
                    self.title = "BEST BANK"
                    self.contentViewTrailingConstraint.constant = 20
                    self.contentViewLeadingConstraint.constant = 20
                    self.headerView.frame.size.height = self.originHeaderViewHeight
                    self.headerView.alpha = 1
                    self.view.layoutIfNeeded()
                    }, completion: { (_) in
                        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
                })
            }
        }
    }

}

