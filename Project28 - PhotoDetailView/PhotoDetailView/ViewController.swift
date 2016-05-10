//
//  ViewController.swift
//  PhotoDetailView
//
//  Created by Khuong Pham on 4/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var barIsHidden = false
    var navigationBarHeight: CGFloat = 0
    var tabBarHeight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.hideAndShowBar))
        view.addGestureRecognizer(tapGesture)
        navigationBarHeight = (self.navigationController?.navigationBar.frame.size.height)!
        tabBarHeight = (self.tabBarController?.tabBar.frame.size.height)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func hideAndShowBar() {
        print("tap!!")
        if barIsHidden == false {
            UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: {
                // fade animation
                self.navigationController?.navigationBar.alpha = 0.0
                self.tabBarController?.tabBar.alpha = 0.0
                // set height animation
                self.navigationController?.navigationBar.frame.size.height = 0.0
                self.tabBarController?.tabBar.frame.size.height = 0.0
                }, completion: { (_) in
                    self.barIsHidden = true
            })
        } else {
            UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: {
                // fade animation
                self.navigationController?.navigationBar.alpha = 1.0
                self.tabBarController?.tabBar.alpha = 1.0
                // set height animation
                self.navigationController?.navigationBar.frame.size.height = self.navigationBarHeight
                self.tabBarController?.tabBar.frame.size.height = self.tabBarHeight
                }, completion: { (_) in
                    self.barIsHidden = false
            })
        }
    }

}

