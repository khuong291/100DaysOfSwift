//
//  ViewController.swift
//  ImageCropper
//
//  Created by Khuong Pham on 3/22/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!

    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        imageView.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height)
        imageView.image = UIImage(named: "troll")
        imageView.userInteractionEnabled = true

        scrollView.addSubview(imageView)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "loadImage:")
        tapGestureRecognizer.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }

    @IBAction func cropAndSaveButtonTapped(sender: AnyObject) {
        UIGraphicsBeginImageContextWithOptions(scrollView.bounds.size, true, UIScreen.mainScreen().scale)
        let offset = scrollView.contentOffset

        CGContextTranslateCTM(UIGraphicsGetCurrentContext(), -offset.x, -offset.y)
        scrollView.layer.renderInContext(UIGraphicsGetCurrentContext()!)

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)

        let alert = UIAlertController(title: "Image saved", message: "Your image has been saved to your camera roll", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }

}

extension ViewController: UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func loadImage(recognizer: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary

        presentViewController(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage

        imageView.image = image
        imageView.contentMode = UIViewContentMode.Center
        imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height)

        scrollView.contentSize = image.size

        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)

        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 1
        scrollView.zoomScale = minScale

        centerScrollViewContents()

        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    func centerScrollViewContents() {
        let boundsSize = scrollView.bounds.size
        var contentsFrame = imageView.frame

        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2
        } else {
            contentsFrame.origin.x = 0
        }

        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2
        } else {
            contentsFrame.origin.y = 0
        }

        imageView.frame = contentsFrame
    }

    func scrollViewDidZoom(scrollView: UIScrollView) {
        centerScrollViewContents()
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

