//
//  CustomSearchBar.swift
//  CustomSearchBar
//
//  Created by Khuong Pham on 3/30/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {

    var preferredFont: UIFont!

    var preferredTextColor: UIColor!


    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code

        // Find the index of the search field in the search bar subviews.
        if let index = indexOfSearchFieldInSubviews() {
            // Access the search field
            let searchField: UITextField = (subviews[0] ).subviews[index] as! UITextField

            // Set its frame.
            searchField.frame = CGRectMake(5.0, 5.0, frame.size.width - 10.0, frame.size.height - 10.0)

            // Set the font and text color of the search field.
            searchField.font = preferredFont
            searchField.textColor = preferredTextColor

            // Set the background color of the search field.
            searchField.backgroundColor = barTintColor
        }

        let startPoint = CGPointMake(0.0, frame.size.height)
        let endPoint = CGPointMake(frame.size.width, frame.size.height)
        let path = UIBezierPath()
        path.moveToPoint(startPoint)
        path.addLineToPoint(endPoint)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = preferredTextColor.CGColor
        shapeLayer.lineWidth = 2.5

        layer.addSublayer(shapeLayer)

        super.drawRect(rect)
    }



    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)

        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor

        searchBarStyle = UISearchBarStyle.Prominent
        translucent = false
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    func indexOfSearchFieldInSubviews() -> Int! {
        // Uncomment the next line to see the search bar subviews.
        // println(subviews[0].subviews)

        var index: Int!
        let searchBarView = subviews[0]

        for var i=0; i<searchBarView.subviews.count; ++i {
            if searchBarView.subviews[i].isKindOfClass(UITextField) {
                index = i
                break
            }
        }

        return index
    }
}
