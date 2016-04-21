//
//  ViewController.swift
//  AddConstraintsProgrammatically
//
//  Created by Khuong Pham on 4/21/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blackColor()

        contentView.backgroundColor = UIColor.greenColor()
        contentView.frame.size.width = 250
        contentView.frame.size.height = 100
        contentView.center = view.center
        contentView.layer.cornerRadius = 5
        view.addSubview(contentView)

        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Username:"
        contentView.addSubview(userNameLabel)

        let passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password:"
        contentView.addSubview(passwordLabel)

        let usernameTextField = UITextField()
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.borderStyle = .RoundedRect
        contentView.addSubview(usernameTextField)

        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .RoundedRect
        contentView.addSubview(passwordTextField)

        let submitButton = UIButton()
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("Submit", forState: .Normal)
        submitButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        submitButton.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        contentView.addSubview(submitButton)

        // For Username
        NSLayoutConstraint(item: userNameLabel, attribute: .Leading, relatedBy: .Equal, toItem: contentView, attribute: .LeadingMargin, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: userNameLabel, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1, constant: 10).active = true
        NSLayoutConstraint(item: usernameTextField, attribute: .Trailing, relatedBy: .Equal, toItem: contentView, attribute: .TrailingMargin, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: usernameTextField, attribute: .Leading, relatedBy: .Equal, toItem: userNameLabel, attribute: .Trailing, multiplier: 1.0, constant: 3).active = true
        NSLayoutConstraint(item: userNameLabel, attribute: .Baseline, relatedBy: .Equal, toItem: usernameTextField, attribute: .Baseline, multiplier: 1.0, constant: 0.0).active = true
        // For Password
        NSLayoutConstraint(item: passwordLabel, attribute: .Leading, relatedBy: .Equal, toItem: contentView, attribute: .LeadingMargin, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: passwordLabel, attribute: .Top, relatedBy: .Equal, toItem: userNameLabel, attribute: .Bottom, multiplier: 1, constant: 15).active = true
        NSLayoutConstraint(item: passwordTextField, attribute: .Trailing, relatedBy: .Equal, toItem: contentView, attribute: .TrailingMargin, multiplier: 1.0, constant: 0.0).active = true
        NSLayoutConstraint(item: passwordTextField, attribute: .Leading, relatedBy: .Equal, toItem: passwordLabel, attribute: .Trailing, multiplier: 1.0, constant: 3).active = true
        NSLayoutConstraint(item: passwordLabel, attribute: .Baseline, relatedBy: .Equal, toItem: passwordTextField, attribute: .Baseline, multiplier: 1.0, constant: 0.0).active = true

        userNameLabel.setContentHuggingPriority(251, forAxis: .Horizontal)
        passwordLabel.setContentHuggingPriority(251, forAxis: .Horizontal)

        // For Button
        NSLayoutConstraint(item: submitButton, attribute: .Top, relatedBy: .Equal, toItem: passwordLabel, attribute: .Bottom, multiplier: 1.0, constant: 8.0).active = true
        NSLayoutConstraint(item: submitButton, attribute: .CenterX, relatedBy: .Equal, toItem: contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true
    }

    override func viewDidLayoutSubviews() {
        contentView.center = view.center
    }

}

