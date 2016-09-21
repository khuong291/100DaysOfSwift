//
//  ViewController.swift
//  Project77 - CachingImages
//
//  Created by Khuong Pham on 9/20/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(stringURL: String) -> UIImage? {
        if let url = NSURL(string: stringURL), let data = NSData(contentsOfURL: url) {
            return UIImage(data: data) ?? nil
        }
        return nil
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!

    var birds: [Bird] = []
    var imageCache: [UIImage] = []
    var recordSet: Int = 0
    var imagesPath = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<10 {
            if let cacheImage = loadImageCache(i) {
                imageCache.append(cacheImage)
            }
        }
        dispatch_async(dispatch_get_main_queue(), {
            self.recordSet = self.imageCache.count
            self.tableView.reloadData()
        })
        if imageCache.count <= 0 {
            getData(recordSet)
        }

        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(ViewController.loadMore), forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func loadImageCache(index: Int) -> UIImage? {
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        let imagePath = documentsURL.absoluteString.stringByAppendingString("\(index).png")
        if let url = NSURL(string: imagePath), let data = NSData(contentsOfURL: url) {
            let image = UIImage(data: data)
            return image!
        }
        return nil
    }

    private func getData(index: Int) {
        if let url = NSURL(string: "http://labkhoapham.com/GETSP.php?index=\(index)&numberPages=10") {
            let request = NSURLRequest(URL: url)
            let session = NSURLSession.sharedSession()
            session.dataTaskWithRequest(request, completionHandler: { (data, response, error) in
                if let data = data {
                    do {
                        if let result: [[String : AnyObject]] = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [[String : AnyObject]] {
                            for dict in result {
                                self.birds.append(Bird(jsonDict: dict))
                                self.imageCache.append(UIImage(named: "load")!)
                            }
                            self.recordSet = self.birds.count 
                            print(self.birds)
                            for i in 0..<self.birds.count {
                                self.loadImages(self.birds[i].image, index: i)
                            }
                            dispatch_async(dispatch_get_main_queue(), {
                                self.tableView.reloadData()
                            })
                        }
                    } catch let error as NSError {
                        print("Error \(error.localizedDescription)")
                    }
                }
            }).resume()
        }
    }

    private func loadImages(stringURL: String, index: Int) {
        dispatch_async(dispatch_get_global_queue(0, 0), {
            if let url = NSURL(string: stringURL), let data = NSData(contentsOfURL: url) {
                self.imageCache[index] = UIImage(data: data)!

                let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
                let fileURL = documentsURL.URLByAppendingPathComponent("\(index).png")
                if let pngImageData = UIImagePNGRepresentation(self.imageCache[index]) {
                    pngImageData.writeToURL(fileURL, atomically: false)
                }

                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: 0)], withRowAnimation: .Automatic)
                })
            }
        })
    }

    func loadMore() {
        getData(recordSet)
        delay(1) {
            if self.refreshControl.refreshing {
                self.refreshControl.endRefreshing()
            }
        }

    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageCache.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell

        if birds.count > 0 {
            let bird = birds[indexPath.row]
            cell.birdNameLabel.text = bird.name
        }
        cell.birdImageView.image = imageCache[indexPath.row]

        if imageCache[indexPath.row] == UIImage(named: "load") {
            cell.loadingView.startAnimating()
        } else {
            cell.loadingView.stopAnimating()
            cell.loadingView.hidesWhenStopped = true
        }

        return cell
    }

}

