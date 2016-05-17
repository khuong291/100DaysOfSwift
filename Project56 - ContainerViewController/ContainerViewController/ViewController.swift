//
//  ViewController.swift
//  ContainerViewController
//
//  Created by Khuong Pham on 5/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var codewarsImageView: UIImageView!
    @IBOutlet var stackoverflowImageView: UIImageView!
    @IBOutlet var githubImageView: UIImageView!
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var containerView: UIView!

    var gitHubVC: UIViewController?
    var stackOverFlowVC: UIViewController? = nil
    var codeWarsVC: UIViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        gitHubVC = storyboard?.instantiateViewControllerWithIdentifier("GithubViewController") as! GithubViewController
        stackOverFlowVC = storyboard?.instantiateViewControllerWithIdentifier("StackOverFlowViewController") as! StackOverFlowViewController
        codeWarsVC = storyboard?.instantiateViewControllerWithIdentifier("CodeWarsViewController") as! CodeWarsViewController

        addSubViewController(parentVC: self, viewCtrl: gitHubVC!)

        makeImagesCircle()
        addTapGestureToImages()

    }

    private func makeImagesCircle() {
        UIImageView.makeImageCircle(avatarImageView)
        UIImageView.makeImageCircle(githubImageView)
        UIImageView.makeImageCircle(stackoverflowImageView)
        UIImageView.makeImageCircle(codewarsImageView)
    }

    private func addTapGestureToImages() {
        let gitHubTapGesture = UITapGestureRecognizer(target: self, action: #selector(openGithubVC))
        githubImageView.addGestureRecognizer(gitHubTapGesture)
        let stackOverFlowTapGesture = UITapGestureRecognizer(target: self, action: #selector(openStackOverFlowVC))
        stackoverflowImageView.addGestureRecognizer(stackOverFlowTapGesture)
        let codeWarsTapGesture = UITapGestureRecognizer(target: self, action: #selector(opencodeWarsVC))
        codewarsImageView.addGestureRecognizer(codeWarsTapGesture)
    }

    func openGithubVC() {
        removeFromSuperViewController(codeWarsVC!)
        addSubViewController(parentVC: self, viewCtrl: gitHubVC!)
    }

    func openStackOverFlowVC() {
        removeFromSuperViewController(gitHubVC!)
        addSubViewController(parentVC: self, viewCtrl: stackOverFlowVC!)
    }

    func opencodeWarsVC() {
        removeFromSuperViewController(stackOverFlowVC!)
        addSubViewController(parentVC: self, viewCtrl: codeWarsVC!)
    }
}

extension UIViewController {
    func addSubViewController(parentVC parentVC: ViewController, viewCtrl: UIViewController) {
        viewCtrl.willMoveToParentViewController(parentVC)
        parentVC.containerView.addSubview(viewCtrl.view)
        parentVC.addChildViewController(viewCtrl)
        viewCtrl.didMoveToParentViewController(parentVC)
    }

    func removeFromSuperViewController(viewCtrl: UIViewController) {
        viewCtrl.willMoveToParentViewController(nil)
        viewCtrl.view.removeFromSuperview()
        viewCtrl.removeFromParentViewController()
        viewCtrl.didMoveToParentViewController(nil)
    }

    func animateViewController(vc: UIViewController) {
        vc.view.frame.size.height += vc.view.frame.height
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: [.CurveEaseInOut], animations: { 
            vc.view.frame.size.height -= vc.view.frame.height
            }, completion: nil)
    }
}

extension UIImageView {
    class func makeImageCircle(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
    }
}

