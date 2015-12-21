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

    func playSounds(rate:Float){
        audioPlayer.stop()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playSlowSounds(sender: UIButton) {
        playSounds(0.5)
    }
    
    @IBAction func playRapidSounds(sender: UIButton) {
        playSounds(1.5)
    }
    
    @IBAction func stopPlaySounds(sender: UIButton) {
        audioPlayer.stop()
    }
    
    

    

}
