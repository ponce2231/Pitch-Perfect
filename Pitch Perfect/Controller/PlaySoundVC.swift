//
//  PlaySoundVC.swift
//  Pitch Perfect
//
//  Created by Christopher Ponce Mendez on 5/22/19.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundVC: UIViewController {
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, highPitch, lowPitch, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .highPitch:
            playSound(pitch: 1000)
        case .lowPitch:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        stopAudio()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
}
