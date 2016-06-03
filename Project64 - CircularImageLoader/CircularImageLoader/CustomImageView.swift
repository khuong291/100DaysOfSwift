//
//  CustomImageView.swift
//  CircularImageLoader
//
//  Created by Khuong Pham on 6/3/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import SDWebImage

class CustomImageView: UIImageView {

    let progressIndicatorView = CircularLoaderView(frame: CGRectZero)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        addSubview(self.progressIndicatorView)
        progressIndicatorView.frame = bounds
        progressIndicatorView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]

        let url = NSURL(string: "http://www.freedisneywallpaper.com/wallpaper/AnimalKingdom10HD.jpg")
        sd_setImageWithURL(url, placeholderImage: nil, options: .CacheMemoryOnly, progress: {
            [weak self]
            (receivedSize, expectedSize) -> Void in
            self!.progressIndicatorView.progress = CGFloat(receivedSize)/CGFloat(expectedSize)
        }) {
            [weak self]
            (image, error, _, _) -> Void in
            self!.progressIndicatorView.reveal()
        }
    }
}



