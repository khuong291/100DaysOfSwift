//
//  ViewController.swift
//  StretchyHeader
//
//  Created by Khuong Pham on 6/3/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet var tableView: UITableView!
    var footBallClubs: [FootBallClub]!

    private let kTableHeaderHeight: CGFloat = 200.0
    private let kTableHeaderCutAway: CGFloat = 80.0
    var headerMaskLayer: CAShapeLayer!
    var headerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        initData()

        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)

        let effectiveHeight = kTableHeaderHeight - kTableHeaderCutAway / 2
        tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)

        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.blackColor().CGColor
        headerView.layer.mask = headerMaskLayer

        updateHeaderView()
    }

    private func updateHeaderView() {
        let effectiveHeight = kTableHeaderHeight - kTableHeaderCutAway / 2
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect

        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLineToPoint(CGPoint(x: 0, y: headerRect.height - kTableHeaderCutAway))
        headerMaskLayer?.path = path.CGPath
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

    // TableView DataSource

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

    // ScrollView Delegate

    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
}

