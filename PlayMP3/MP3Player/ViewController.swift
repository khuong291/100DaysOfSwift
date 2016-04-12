//
//  ViewController.swift
//  MP3Player
//
//  Created by James Tyner on 7/5/15.
//  Copyright (c) 2015 James Tyner. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var mp3Player:MP3Player?
    var timer:NSTimer?
    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackTime: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    @IBAction func playSong(sender: AnyObject) {
        
    }
    @IBAction func stopSong(sender: AnyObject) {
        
    }
    
    @IBAction func pauseSong(sender: AnyObject) {
        
    }
    
    @IBAction func playNextSong(sender: AnyObject) {
    }
    
    
    @IBAction func setVolume(sender: UISlider) {
        
    }
    
    @IBAction func playPreviousSong(sender: AnyObject) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}