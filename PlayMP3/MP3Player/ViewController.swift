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
    
    var mp3Player: MP3Player?
    var timer: NSTimer?
    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackTime: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mp3Player = MP3Player()
        setupNotificationCenter()
        setTrackName()
        updateViews()
    }
    @IBAction func playSong(sender: AnyObject) {
        mp3Player?.play()
        startTimer()
    }
    @IBAction func stopSong(sender: AnyObject) {
        mp3Player?.stop()
        updateViews()
        timer?.invalidate()
    }
    
    @IBAction func pauseSong(sender: AnyObject) {
        mp3Player?.pause()
        timer?.invalidate()
    }
    
    @IBAction func playNextSong(sender: AnyObject) {
        mp3Player?.nextSong(false)
        startTimer()
    }
    
    
    @IBAction func setVolume(sender: UISlider) {
        mp3Player?.setVolume(sender.value)
    }
    
    @IBAction func playPreviousSong(sender: AnyObject) {
        mp3Player?.previousSong()
        startTimer()
    }

    func startTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.updateViewsWithTimer(_:)), userInfo: nil, repeats: true)
    }

    func updateViewsWithTimer(theTimer: NSTimer){
        updateViews()
    }

    func updateViews(){
        trackTime.text = mp3Player?.getCurrentTimeAsString()
        if let progress = mp3Player?.getProgress() {
            progressBar.progress = progress
        }
    }

    func setTrackName(){
        trackName.text = mp3Player?.getCurrentTrackName()
    }

    func setupNotificationCenter() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setTrackName", name: "SetTrackNameText", object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}