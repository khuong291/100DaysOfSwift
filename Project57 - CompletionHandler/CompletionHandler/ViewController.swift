//
//  ViewController.swift
//  CompletionHandler
//
//  Created by Khuong Pham on 5/22/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var lineViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var lineView: UIView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var downloadButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.lineViewHeightConstraint.constant = 0
        statusLabel.hidden = true

        addBackgroundImage()

        downloadButton.layer.cornerRadius = downloadButton.frame.width / 2
        downloadButton.layer.borderColor = UIColor.whiteColor().CGColor
        downloadButton.layer.borderWidth = 1
        downloadButton.setTitle("Download\nImages", forState: .Normal)

        statusLabel.layer.cornerRadius = 10
        statusLabel.layer.borderColor = UIColor.whiteColor().CGColor
        statusLabel.layer.borderWidth = 1

        downloadButton.titleLabel?.textAlignment = NSTextAlignment.Center
    }

    func addBackgroundImage() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.drawInRect(self.view.bounds)

        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        view.backgroundColor = UIColor(patternImage: image)
    }

    func processDownloadImages(completion: () -> Void) {
        var count = 0
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            if let url = NSURL(string: "https://github.com/khuong291/100DaysOfSwift/blob/master/cover_photo.png"), let _ = NSData(contentsOfURL: url) {
                dispatch_async(dispatch_get_main_queue(), { 
                    self.statusLabel.text = "Image1 is downloaded"
                })
                count += 1
            }
            if let url = NSURL(string: "http://sf.co.ua/13/07/wallpaper-2910355.jpg"), let _ = NSData(contentsOfURL: url) {
                dispatch_async(dispatch_get_main_queue(), {
                    self.statusLabel.text = "Image2 is downloaded"
                })
                count += 1
            }
            if let url = NSURL(string: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQv1W7ydicNeqtGQV_cBDwrjaPU1bpjhGL-muSjAryCvVme4k8V"), let _ = NSData(contentsOfURL: url) {
                dispatch_async(dispatch_get_main_queue(), {
                    self.statusLabel.text = "Image3 is downloaded"
                })
                count += 1
                if count == 3 {
                    completion()
                }
            }
        }
    }

    @IBAction func downloadButtonTapped(sender: AnyObject) {
        UIView.animateWithDuration(1.0, animations: {
            self.lineViewHeightConstraint.constant = 100
            self.view.layoutIfNeeded()
            }, completion: { _ in
                self.statusLabel.hidden = false
        })
        processDownloadImages {
            dispatch_async(dispatch_get_main_queue(), { 
                self.statusLabel.text = "All images are downloaded"
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    UIView.animateWithDuration(1.0, animations: { 
                        self.lineViewHeightConstraint.constant = 0
                        self.view.layoutIfNeeded()
                        }, completion: { _ in
                            self.statusLabel.hidden = true
                    })
                }

            })
        }
    }

}

