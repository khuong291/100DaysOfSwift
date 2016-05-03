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

    var dataSource: [String] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].map {"\($0)"}

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        headerView.backgroundColor = UIColor.blueColor()
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

}

