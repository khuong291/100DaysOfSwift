//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by Khuong Pham on 5/13/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!

    var isExpanded = false
    let detailView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()

        addBackgroundImage()
    }

    func addBackgroundImage() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "blur_background")?.drawInRect(self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        view.backgroundColor = UIColor(patternImage: image)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyTableViewCell
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if !isExpanded {
            isExpanded = true

            let cellContentView = tableView.cellForRowAtIndexPath(indexPath)?.contentView
            let containerViewSize = cellContentView?.subviews.last?.bounds
            detailView.frame.size = CGSize(width: (containerViewSize?.width)!, height: 0)

            let rect = cellContentView!.convertRect(cellContentView!.frame, toView: self.view)
            detailView.center = CGPointMake(rect.origin.x + rect.size.width / 2, rect.origin.y + rect.size.height / 2)
            cellContentView!.addSubview(detailView)

            UIView.transitionFromView(self.detailView, toView: self.detailView.contentView, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromTop, completion: nil)

            UIView.animateWithDuration(0.5, delay: 0, options: [.CurveEaseInOut], animations: {
                tableView.cellForRowAtIndexPath(indexPath)?.frame.size.height += 50
                cellContentView?.frame.size.height += 20
                self.detailView.center.y += 30
                self.detailView.frame.size.height += (containerViewSize?.height)!
                }, completion: nil)

        } else {
            isExpanded = false

            let cellContentView = tableView.cellForRowAtIndexPath(indexPath)?.contentView
            let containerViewSize = cellContentView?.subviews.last?.bounds
            detailView.frame.size = CGSize(width: (containerViewSize?.width)!, height: 0)

            let rect = cellContentView!.convertRect(cellContentView!.frame, toView: self.view)
            detailView.center = CGPointMake(rect.origin.x + rect.size.width / 2, rect.origin.y + rect.size.height / 2)

            UIView.transitionFromView(self.detailView.contentView, toView: self.detailView, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromBottom, completion: nil)

            UIView.animateWithDuration(0.5, delay: 0, options: [.CurveEaseInOut], animations: {
                tableView.cellForRowAtIndexPath(indexPath)?.frame.size.height -= 50
                cellContentView?.frame.size.height -= 20
                self.detailView.center.y -= 30
                self.detailView.frame.size.height -= (containerViewSize?.height)!
                }, completion: { bool in
                    self.detailView.removeFromSuperview()
                    self.detailView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            })
        }
    }

}

