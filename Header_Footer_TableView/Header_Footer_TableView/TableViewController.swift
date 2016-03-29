//
//  TableViewController.swift
//  Header_Footer_TableView
//
//  Created by Khuong Pham on 3/29/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var countriesinEurope = ["France","Spain","Germany"]
    var countriesinAsia = ["Japan","China","India"]
    var countriesInSouthAmerica = ["Argentia","Brasil","Chile"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        switch (indexPath.section) {
        case 0:
            cell.textLabel?.text = countriesinEurope[indexPath.row]
        case 1:
            cell.textLabel?.text = countriesinAsia[indexPath.row]
        case 2:
            cell.textLabel?.text = countriesInSouthAmerica[indexPath.row]
        default:
            cell.textLabel?.text = "Other"
        }

        return cell
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! CustomHeaderCell
        headerCell.backgroundColor = UIColor.cyanColor()

        switch (section) {
        case 0:
            headerCell.headerLabel.text = "Europe"
        case 1:
            headerCell.headerLabel.text = "Asia"
        case 2:
            headerCell.headerLabel.text = "South America"
        default:
            headerCell.headerLabel.text = "Other"
        }

        return headerCell
    }

    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 2))

        footerView.backgroundColor = UIColor.redColor()

        return footerView
    }

    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2.0
    }
}
