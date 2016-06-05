//
//  ViewController.swift
//  AnimateTableViewCell
//
//  Created by Khuong Pham on 6/4/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var trips: [Trip]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
    }

    private func initData() {
        let londonTrip = Trip(placeName: "London", price: "$700", fromDate: "Jun 5", toDate: "Jun 7", coverImage: UIImage(named: "london")!)
        let osloTrip = Trip(placeName: "Oslo", price: "$650", fromDate: "Jun 8", toDate: "Jun 10", coverImage: UIImage(named: "oslo")!)
        let parisTrip = Trip(placeName: "Paris", price: "$720", fromDate: "Jun 11", toDate: "Jun 13", coverImage: UIImage(named: "paris")!)
        let romeTrip = Trip(placeName: "Rome", price: "$540", fromDate: "Jun 14", toDate: "Jun 15", coverImage: UIImage(named: "rome")!)
        let amsterdamTrip = Trip(placeName: "Amsterdam", price: "$450", fromDate: "Jun 16", toDate: "Jun 17", coverImage: UIImage(named: "amsterdam")!)
        trips = [Trip]()
        trips.appendContentsOf([londonTrip, osloTrip, parisTrip, romeTrip, amsterdamTrip])
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.alpha = 0.8
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform

        UIView.animateWithDuration(1.0, delay: 0.0, options: [.CurveEaseInOut], animations: {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
            }, completion: nil)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AnimateTableViewCell

        let trip = trips[indexPath.row]
        cell.placeNameLabel.text = trip.placeName
        cell.coverImageView.image = trip.coverImage
        cell.fromLabel.text = trip.fromDate
        cell.toLabel.text = trip.toDate
        cell.priceLabel.text = trip.price

        return cell
    }
}

