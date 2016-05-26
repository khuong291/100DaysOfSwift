//
//  ViewController.swift
//  FetchingImagesFromPhotoLibrary
//
//  Created by Khuong Pham on 5/26/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import AssetsLibrary

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!

    var images: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPhotos()
    }

    private func fetchPhotos() {
        let library = ALAssetsLibrary()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { 
            library.enumerateGroupsWithTypes(ALAssetsGroupAll, usingBlock: { (group, stop) in
                if group != nil {
                    group.setAssetsFilter(ALAssetsFilter.allPhotos())
                    group.enumerateAssetsUsingBlock({ (result, index, stop) in
                        if result != nil {
                            let cgFullScreenImage = result.defaultRepresentation().fullScreenImage().takeUnretainedValue()
                            let thumbnailImage = UIImage(CGImage: cgFullScreenImage)
                            self.images.append(thumbnailImage)
                            dispatch_async(dispatch_get_main_queue(), { 
                                self.collectionView.reloadData()
                            })
                        }
                    })
                } else if group == nil {
                    print("Finished fetching images")
                }
            }) { (error) in
                print("Error: " + error.localizedDescription)
            }
        }
    }

    // MARK: CollectionView Protocol
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2 - 5, height: self.view.frame.width / 2 - 5)
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MyCollectionViewCell
        cell.myImageView.image = images[indexPath.row]
        return cell
    }
}

