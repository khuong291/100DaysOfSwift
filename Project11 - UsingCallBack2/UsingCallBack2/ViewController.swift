//
//  ViewController.swift
//  UsingCallBack2
//
//  Created by Khuong Pham on 3/30/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToViewController2(sender: AnyObject) {
        let vc2 = storyboard?.instantiateViewControllerWithIdentifier("ViewController2") as! ViewController2
        // Download Asynchronously
        vc2.callback = ({ string in
            self.imageView.downloadedFrom(link: string, contentMode: UIViewContentMode.ScaleAspectFit)
        })
        presentViewController(vc2, animated: true, completion: nil)
    }
}

extension UIImageView {
    func downloadedFrom(link link:String, contentMode mode: UIViewContentMode) {
        guard
            let url = NSURL(string: link)
            else {return}
        contentMode = mode
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            guard
                let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
                let mimeType = response?.MIMEType where mimeType.hasPrefix("image"),
                let data = data where error == nil,
                let image = UIImage(data: data)
                else { return }
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.image = image
            }
        }).resume()
    }
}

