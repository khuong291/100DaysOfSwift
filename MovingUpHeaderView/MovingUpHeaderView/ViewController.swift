//
//  ViewController.swift
//  MovingUpHeaderView
//
//  Created by Khuong Pham on 5/3/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var actionLabel: UILabel!

    var dataSource: [String] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].map {"\($0)"}
    let threshold = 500.0

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        tableView.tableHeaderView = headerView
        contentView.layer.cornerRadius = 10
        actionLabel.layer.cornerRadius = 10
        actionLabel.clipsToBounds = true

    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel!.text = dataSource[indexPath.row]
        return cell
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if Double(maximumOffset - contentOffset) <= threshold {
            dispatch_async(dispatch_get_main_queue()) {
                UIView.animateWithDuration(0.7, delay: 0.0, options: [.CurveEaseInOut], animations: {
//                    self.headerView.heightAnchor.
                    self.view.layoutIfNeeded()
                    }, completion: { (_) in
                        self.navigationController?.navigationBar.barTintColor = self.headerView.backgroundColor
                })
            }
        }
    }

}

