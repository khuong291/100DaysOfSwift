//
//  ViewController.swift
//  AsynchronousImageLoading
//
//  Created by Khuong Pham on 7/16/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var imageURLs = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
    }

    // MARK: InitData

    private func initData() {
        for i in 0..<100 {
            self.imageURLs.append(NSString(format: "http://dummyimage.com/88/%06X/%06X&text=%d", arc4random() % 0xFFFFFF, arc4random() % 0xFFFFFF, i + 1) as String)
        }
    }

    // MARK: UITableViewDataSource && UITableViewDelegate

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageURLs.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ImageTableViewCell", forIndexPath: indexPath) as! ImageTableViewCell
        cell.imgView.image = UIImage(named: "load")
        cell.imgView.af_setImageWithURL(NSURL(string: imageURLs[indexPath.row])!)

        return cell
    }

}

