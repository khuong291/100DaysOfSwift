//
//  ViewController.swift
//  CacheImageUsingNSUserDefault
//
//  Created by Khuong Pham on 4/1/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    let userDefault = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageData = userDefault.objectForKey("khuong") as? NSData
        if let imageData = imageData {
            let image = UIImage(data: imageData)
            imageView.image = image
        }
    }


    @IBAction func downloadButtonTapped(sender: AnyObject) {
        let url = NSURL(string: "https://avatars3.githubusercontent.com/u/11523438?v=3&s=460")
        let data = NSData(contentsOfURL: url!)
        let image = UIImage(data: data!)
        imageView.image = image
        if let image = image {
            let imageData = UIImagePNGRepresentation(image)
            userDefault.setObject(imageData, forKey: "khuong")
        }
    }
}

