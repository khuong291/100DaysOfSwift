//
//  ViewController.swift
//  AddConstraintsProgrammatically2
//
//  Created by Khuong Pham on 4/22/16.
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

        let usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "Username:"
        contentView.addSubview(usernameLabel)

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
        submitButton.setTitleColor(UIColor.blueColor(), forState: .Highlighted)
        contentView.addSubview(submitButton)

        //For Username
        usernameLabel.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor, constant: 0).active = true
        usernameLabel.topAnchor.constraintEqualToAnchor(contentView.topAnchor, constant: 10).active = true
        usernameTextField.firstBaselineAnchor.constraintEqualToAnchor(usernameLabel.firstBaselineAnchor, constant: 0).active = true
        usernameTextField.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor, constant: -8.0).active = true
        usernameTextField.leadingAnchor.constraintEqualToAnchor(usernameLabel.trailingAnchor, constant: 5.0).active = true
        //For Password
        passwordLabel.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor, constant: 0).active = true
        passwordLabel.topAnchor.constraintEqualToAnchor(usernameLabel.bottomAnchor, constant: 15).active = true
        passwordTextField.firstBaselineAnchor.constraintEqualToAnchor(passwordLabel.firstBaselineAnchor, constant: 0).active = true
        passwordTextField.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor, constant: -8.0).active = true
        passwordTextField.leadingAnchor.constraintEqualToAnchor(passwordLabel.trailingAnchor, constant: 5.0).active = true
        //For Button
        usernameLabel.setContentHuggingPriority(251, forAxis: .Horizontal)
        passwordLabel.setContentHuggingPriority(251, forAxis: .Horizontal)

        // For Button
        NSLayoutConstraint(item: submitButton, attribute: .Top, relatedBy: .Equal, toItem: passwordLabel, attribute: .Bottom, multiplier: 1.0, constant: 8.0).active = true
        NSLayoutConstraint(item: submitButton, attribute: .CenterX, relatedBy: .Equal, toItem: contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0).active = true

    }

    override func viewDidLayoutSubviews() {
        contentView.center = view.center
    }

}

