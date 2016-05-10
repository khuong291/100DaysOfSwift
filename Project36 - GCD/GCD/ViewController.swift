//
//  ViewController.swift
//  GCD
//
//  Created by Khuong Pham on 4/15/16.
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didClickOnStart(sender: AnyObject) {

        let concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        let serialQueue = dispatch_queue_create("khuong", DISPATCH_QUEUE_SERIAL)

        dispatch_async(serialQueue) {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            dispatch_async(dispatch_get_main_queue()) {
                self.imageView1.image = img1
            }
        }

        dispatch_async(serialQueue) {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            dispatch_async(dispatch_get_main_queue()) {
                self.imageView2.image = img2
            }
        }

        dispatch_async(serialQueue) {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            dispatch_async(dispatch_get_main_queue()) {
                self.imageView3.image = img3
            }
        }

        dispatch_async(serialQueue) {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            dispatch_async(dispatch_get_main_queue()) {
                self.imageView4.image = img4
            }
        }

    }
    @IBAction func sliderValueChanged(sender: UISlider) {

        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }
    
}


