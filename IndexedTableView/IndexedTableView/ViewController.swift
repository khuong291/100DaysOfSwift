//
//  ViewController.swift
//  IndexedTableView
//
//  Created by Khuong Pham on 4/25/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var tableView: UITableView!
    var tableData = [String]()
    var indexOfNumbers = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let allNumbers = "100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500"
        tableData = allNumbers.componentsSeparatedByString(" ")

        let indexNumbers = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15"
        indexOfNumbers = indexNumbers.componentsSeparatedByString(" ")

        tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        view.addSubview(tableView)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return indexOfNumbers.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel?.text = tableData[indexPath.section]

        return cell
    }

    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return indexOfNumbers
    }

    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        let temp = indexOfNumbers as NSArray
        return temp.indexOfObject(title)
    }
}

