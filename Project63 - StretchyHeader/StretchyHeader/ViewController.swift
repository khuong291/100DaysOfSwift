//
//  ViewController.swift
//  StretchyHeader
//
//  Created by Khuong Pham on 6/3/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var footBallClubs: [FootBallClub]!

    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
    }

    private func initData() {
        let liverpoolFC = FootBallClub(fcName: "Liverpool", fcLogoImage: UIImage(named: "liverpool")!, fcNameColor: UIColor.redColor())
        let chelseaFC = FootBallClub(fcName: "Chelsea", fcLogoImage: UIImage(named: "chelsea")!, fcNameColor: UIColor.blueColor())
        let manUFC = FootBallClub(fcName: "Manchester United", fcLogoImage: UIImage(named: "manu")!, fcNameColor: UIColor.redColor())
        let manCityFC = FootBallClub(fcName: "Manchester City", fcLogoImage: UIImage(named: "mancity")!, fcNameColor: UIColor.blueColor())
        let arsenalFC = FootBallClub(fcName: "Arsenal", fcLogoImage: UIImage(named: "arsenal")!, fcNameColor: UIColor.redColor())
        footBallClubs = []
        footBallClubs.appendContentsOf([liverpoolFC, chelseaFC, manUFC, manCityFC, arsenalFC])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return footBallClubs.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! FCTableViewCell
        let footBallClub = footBallClubs[indexPath.row]
        cell.fcNameLabel.text = footBallClub.fcName
        cell.fcLogoImageView.image = footBallClub.fcLogoImage
        cell.fcNameLabel.textColor = footBallClub.fcNameColor
        return cell
    }


}

