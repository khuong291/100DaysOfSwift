//
//  ViewController.swift
//  NSOperation
//
//  Created by Khuong Pham on 4/16/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                 "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                 "http://algoos.com/wp-content/uploads/2015/08/ireland-02.jpg",
                 "http://bdo.se/wp-content/uploads/2014/01/Stockholm1.jpg"]

class Downloader {

    class func downloadImageWithURL(url:String) -> UIImage! {

        let data = NSData(contentsOfURL: NSURL(string: url)!)
        return UIImage(data: data!)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!

    @IBOutlet weak var imageView2: UIImageView!

    @IBOutlet weak var imageView3: UIImageView!

    @IBOutlet weak var imageView4: UIImageView!

    @IBOutlet weak var sliderValueLabel: UILabel!

    var queue = NSOperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didClickOnStart(sender: AnyObject) {

        queue = NSOperationQueue()
        let operation1 = NSBlockOperation(block: {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.imageView1.image = img1
            })
        })

        operation1.completionBlock = {
            print("Operation 1 completed")
        }

        let operation2 = NSBlockOperation(block: {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.imageView2.image = img2
            })
        })

        operation2.completionBlock = {
            print("Operation 2 completed")
        }

        let operation3 = NSBlockOperation(block: {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.imageView3.image = img3
            })
        })

        operation3.completionBlock = {
            print("Operation 3 completed")
        }

        let operation4 = NSBlockOperation(block: {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.imageView4.image = img4
            })
        })
        
        operation4.completionBlock = {
            print("Operation 4 completed")
        }

        operation2.addDependency(operation3)
        operation4.addDependency(operation2)
        operation1.addDependency(operation4)

        queue.addOperation(operation1)
        queue.addOperation(operation2)
        queue.addOperation(operation3)
        queue.addOperation(operation4)

    }
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }
    
}

