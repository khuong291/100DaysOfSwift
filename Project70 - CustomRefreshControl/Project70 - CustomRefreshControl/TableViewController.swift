//
//  ViewController.swift
//  Project70 - CustomRefreshControl
//
//  Created by Khuong Pham on 8/18/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var textArray = [String]()
    var refresh = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        textArray = ["You", "Are", "Awesome"]

        refresh.tintColor = UIColor.clearColor()
        refresh.backgroundColor = UIColor.clearColor()

        loadRefreshControl()

        self.tableView.addSubview(refresh)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadRefreshControl() {
        let refreshContent = NSBundle.mainBundle().loadNibNamed("RefreshView", owner: self, options: nil)

        let customView = refreshContent[0] as! UIView
        customView.frame = refresh.bounds
        customView.backgroundColor = UIColor.clearColor()

        let customLabel = customView.viewWithTag(1) as! UILabel

        customLabel.textColor = UIColor.whiteColor()
        UIView.animateWithDuration(0.5, delay: 0, options: [.Autoreverse, .CurveEaseInOut, .Repeat], animations: {
            customView.backgroundColor = UIColor.orangeColor()
            customView.backgroundColor = UIColor.greenColor()
            }, completion: nil)

        self.refresh.addSubview(customView)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel?.text = textArray[indexPath.row]

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        refresh.endRefreshing()
    }
}

