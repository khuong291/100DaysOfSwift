//
//  ViewController.swift
//  OpenPDF
//
//  Created by Khuong Pham on 4/25/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSBundle.mainBundle().URLForResource("khuong", withExtension: "pdf")

        if let url = url {
            let webView = UIWebView(frame: self.view.frame)
            let urlRequest = NSURLRequest(URL: url)
            webView.loadRequest(urlRequest)

            view.addSubview(webView)
        }
    }

}

