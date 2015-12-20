//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by HhhotDog on 15/12/20.
//  Copyright © 2015年 Alexscott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
    }
    

    @IBAction func recordAudio(sender: UIButton) {
        //add text "正在录音"
        recordingInProgress.hidden = false
        stopButton.hidden = false
        //TODO: 录音
        print("I'm recording")
    
    }
    @IBAction func stopRecording(sender: UIButton) {
        recordingInProgress.hidden = true
    }

}

