//
//  TimerController.swift
//  countdownTimer
//
//  Created by Naghmeh on 1/1/17.
//  Copyright © 2017 Naghmeh. All rights reserved.
//

import UIKit
import AVFoundation

class TimerController: UIViewController {
    var seconds = 30
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()

    //To change properties of the start button
    @IBOutlet weak var startOutlet: UIButton!
    // To listen for an action when start is clicked
    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.counter), userInfo: nil, repeats: true)
        
        
        startOutlet.isHidden = true
        sliderOutlet.isHidden = true
    }
    func counter()
    {
        seconds = seconds - 1
        countdownLabel.text = String(seconds)
        if(seconds == 0)
        {
            timer.invalidate()
            audioPlayer.play()
        }
    }
    
    //To listen for an action when stop is clicked
    @IBAction func stop(_ sender: UIButton) {
        
        timer.invalidate()
        startOutlet.isHidden = false
        sliderOutlet.isHidden = false
        sliderOutlet.setValue(30, animated: true)
        countdownLabel.text = "30"
        seconds = 30
        audioPlayer.stop()
        
    }
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        countdownLabel.text = String(seconds)
    }
    @IBOutlet var countdownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let audioPath = Bundle.main.path(forResource: "alarm", ofType: ".mp3")
        let audioURL = URL(fileURLWithPath: audioPath!)
        do {
            try audioPlayer = AVAudioPlayer.init(contentsOf: audioURL)
        } catch {
            //cannot load the file
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

