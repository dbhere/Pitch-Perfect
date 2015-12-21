//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by HhhotDog on 15/12/20.
//  Copyright © 2015年 Alexscott. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            let pathURL = NSURL(fileURLWithPath: filePath)
            audioPlayer = try!
                AVAudioPlayer(contentsOfURL: pathURL)
            audioPlayer.enableRate = true
        }else {
            print("file not found")
        }
        
    }

    @IBAction func playSlowSounds(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }
    
    @IBAction func playRapidSounds(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 1.5
        audioPlayer.play()
    }
    
    @IBAction func stopPlaySounds(sender: UIButton) {
        audioPlayer.stop()
    }
    
    

    

}
