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
    var audioPlayer2:AVAudioPlayer!
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
        audioPlayer2 = try! AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
    }

    //按照不同速率播放声音
    func playSounds(rate:Float){
        audioPlayer.stop()
        audioPlayer2.stop()
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
    
    //暂停键
    @IBAction func stopPlaySounds(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer2.stop()
    }
    //按照不同音调播放
    func playsoundsWithPitch(pitch:Float){
        audioPlayer.stop()
        audioPlayer2.stop()
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

    //播放回声效果
    @IBAction func playEchoAudio(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer2.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        
        let delay:NSTimeInterval = 0.1
        let playtime:NSTimeInterval = audioPlayer2.deviceCurrentTime + delay
        audioPlayer2.volume = 0.5
        audioPlayer2.currentTime = 0.0
        audioPlayer2.playAtTime(playtime)
    }
    

}
