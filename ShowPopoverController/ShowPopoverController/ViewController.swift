//
//  ViewController.swift
//  ShowPopoverController
//
//  Created by Khuong Pham on 3/25/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func barButtonTapped(sender: UIBarButtonItem) {
        let popVC = storyboard?.instantiateViewControllerWithIdentifier("PopViewController") as! PopViewController
        popVC.preferredContentSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 300)
        let navController = UINavigationController(rootViewController: popVC)
        navController.modalPresentationStyle = .Popover

        let popOver = navController.popoverPresentationController
        popOver?.delegate = self
        popOver?.barButtonItem = sender
        presentViewController(navController, animated: true, completion: nil)

    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}

