//
//  ViewController.swift
//  Project71 - SiriSpeech
//
//  Created by Khuong Pham on 8/22/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var microphoneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func microphoneTapped(_ sender: UIButton) {

    }

}

