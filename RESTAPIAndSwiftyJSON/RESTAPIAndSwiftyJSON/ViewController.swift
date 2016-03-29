//
//  ViewController.swift
//  RESTAPIAndSwiftyJSON
//
//  Created by Khuong Pham on 3/28/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var names = [String]()
    var imageURLs = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInstagram()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let names: [String] = names {
            return names.count
        } else {
            return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! InstagramTableViewCell
        cell.nameLabel.text = names[indexPath.row]
        let imageURL = imageURLs[indexPath.row]
        cell.avatarImageView.imageFromUrl(imageURL)
        return cell
    }

    func fetchInstagram() {
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=0f6d7722e11746969c2aaeae0f42b960")
        let session = NSURLSession.sharedSession()

        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            guard error == nil else  {
                print("error loading from URL", error!)
                return
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                let comments = JSON(json)["data"][0]["comments"]["data"].arrayValue
                for comment in comments {
                    let name = comment["from"]["username"].string
                    let imageURL = comment["from"]["profile_picture"].string
                    self.imageURLs.append(imageURL!)
                    self.names.append(name!)
                }
                self.tableView.reloadData()
            })

        }

        task.resume()
    }
}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}

