//
//  ViewController.swift
//  ZoomoutCollectionView
//
//  Created by Khuong Pham on 4/30/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!
    var images = [UIImage]()
    var bigImage: UIImageView?
    var imageWidth: CGFloat?
    var imageHeight: CGFloat?
    var collectionBackgroundView: UIView?
    var bigImageIsShowed = false
    var currentCenterPoint = CGPoint()

    override func viewDidLoad() {
        super.viewDidLoad()
        images = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "1", "2", "3", "4", "5", "6", "7", "8", "9"].map { UIImage(named: $0)! }

        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as!  GuyCollectionViewCell
        cell.guyImageView.image = images[indexPath.row]
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.width / 3)
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(bigImageIsShowed)
        print(currentCenterPoint)
        let cellContentView = collectionView.cellForItemAtIndexPath(indexPath)?.contentView
        let rect = cellContentView!.convertRect(cellContentView!.frame, toView: self.view)

        if bigImageIsShowed == false {
            collectionView.alpha = 0.5
            bigImageIsShowed = true
            showBigImage()
            currentCenterPoint = CGPointMake(rect.origin.x + rect.size.width / 2, rect.origin.y + rect.size.height / 2)
            bigImage?.center = currentCenterPoint
            bigImage?.image = images[indexPath.row]
            UIView.animateWithDuration(0.5, delay: 0, options: [.CurveEaseInOut], animations: {
                self.bigImage!.center = self.view.center
                }, completion: nil)
        } else {
            bigImageIsShowed = false
            dismissBigImage()
        }
    }

    func showBigImage() {
        collectionBackgroundView = UIView()
        collectionBackgroundView?.frame = view.frame
        collectionBackgroundView?.backgroundColor = UIColor.clearColor()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissBigImage))
        collectionBackgroundView?.addGestureRecognizer(gesture)
        bigImage = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.width))
        view.addSubview(collectionBackgroundView!)
        collectionBackgroundView!.addSubview(bigImage!)
    }

    func dismissBigImage() {
        collectionView.alpha = 1
        UIView.animateWithDuration(0.5, delay: 0, options: [.CurveEaseInOut], animations: {
            self.bigImage?.frame.size = CGSize(width: 0, height: 0)
            self.bigImage?.center = self.currentCenterPoint
            }, completion: { _ in
                self.bigImage?.removeFromSuperview()
                self.collectionBackgroundView?.removeFromSuperview()
        })
    }
}

