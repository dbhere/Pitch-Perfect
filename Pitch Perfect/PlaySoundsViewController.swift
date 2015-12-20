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
        }else {
            print("file not found")
        }
        
    }

    @IBAction func playSlowSounds(sender: UIButton) {
        audioPlayer.play()
    }
    
    

    

}
