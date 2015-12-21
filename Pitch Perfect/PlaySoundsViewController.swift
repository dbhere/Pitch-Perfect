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
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = try!
            AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
    }

    func playSounds(rate:Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
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
        audioEngine.stop()
        audioEngine.reset()
    }
    
    func playsoundsWithPitch(pitch:Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let audioPitchEffect = AVAudioUnitTimePitch()
        audioPitchEffect.pitch = pitch
        audioEngine.attachNode(audioPitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: audioPitchEffect, format: nil)
        audioEngine.connect(audioPitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        audioPlayerNode.play()
        
        
    }
    
    @IBAction func playChipmunkVoice(sender: UIButton) {
        playsoundsWithPitch(1000)
    }
    
    @IBAction func playDarthVaderVoice(sender: UIButton) {
        playsoundsWithPitch(-1000)
    }

    

}
