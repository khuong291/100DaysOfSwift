//
//  ButtonExtender.swift
//  UsingIBDesignableAndIBInspectable
//
//  Created by Khuong Pham on 3/28/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class ButtonExtender: UIButton {
    //MARK: PROPERTIES
    @IBInspectable var borderColor: UIColor = UIColor.whiteColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornurRadius: CGFloat = 1.0 {
        didSet {
            layer.cornerRadius = cornurRadius
            clipsToBounds = true
        }
    }

    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        setup()
        configure()
    }

    convenience init() {
        self.init(frame:CGRectZero)
        setup()
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        configure()
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        configure()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        configure()
    }

    func setup() {
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 1.0
    }

    func configure() {
        layer.borderColor = borderColor.CGColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornurRadius
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
