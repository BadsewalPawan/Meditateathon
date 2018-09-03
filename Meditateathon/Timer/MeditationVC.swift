//
//  MeditationVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 29/08/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit
import AVFoundation

class MeditationVC: UIViewController, CountdownTimerDelegate{
    
    
    var countdownTimerDidStart = true
    var recievedCountDownDuration:Int!
    var recievedDoRepeat:Bool!
    var recievedRepeatInterval:Int!
    var dummyDouble:Double = 0.01
    var recievedFirstBellDuration:Int!
    var AudioPlayer:AVAudioPlayer!
    var intervalBellAudioPlayer:AVAudioPlayer!
    var intervalTimer:Timer!
    lazy var countdownTimer: CountdownTimer = {
        let countdownTimer = CountdownTimer()
        return countdownTimer
    }()
    
    @IBOutlet var pausePlayBtn: UIButton!
    @IBOutlet var ProgressBar: ProgressBar!
    @IBOutlet var hourlbl: UILabel!
    @IBOutlet var minutelbl: UILabel!
    @IBOutlet var secondlbl: UILabel!
    @IBOutlet var discardSessionBtn: UIButton!
    @IBOutlet var finishBtn: UIButton!
    

    //timerSetup
    
    func countdownTimerDone() {
        countdownTimerDidStart = false
        pausePlayBtn.isEnabled = false
        pausePlayBtn.alpha = 0.5
        AudioPlayer.stop()
        finishBtn.isHidden = false
        playEndingBell()
        intervalTimer.invalidate()
    }
    
    func countdownTime(time: (hours: String, minutes: String, seconds: String)) {
        hourlbl.text = time.hours
        minutelbl.text = time.minutes
        secondlbl.text = time.seconds
    }
    //playSound
    
    func playAudio(){
        let path = Bundle.main.path(forResource: "BackgroundMusic" , ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do{
            AudioPlayer = try AVAudioPlayer(contentsOf: url)
            AudioPlayer.prepareToPlay()
        }
        catch let error as NSError{
            print(error.description)
        }
        AudioPlayer.numberOfLoops = -1
        AudioPlayer.play()
    }
    
    func playBell(bellName:String){
        let path = Bundle.main.path(forResource: bellName , ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do{
            intervalBellAudioPlayer = try AVAudioPlayer(contentsOf: url)
            intervalBellAudioPlayer.prepareToPlay()
        }
        catch let error as NSError{
            print(error.description)
        }
        intervalBellAudioPlayer.play()
    }
    
    @objc func playIntervalBell(){
        dummyDouble -= 0.01
        if(dummyDouble <= 0){
            playBell(bellName: "RepeatingBell")
            dummyDouble = Double(recievedRepeatInterval)
        }
    }
    
    @objc func playFirstBell(){
        dummyDouble -= 0.01
        if(dummyDouble <= 0){
            playBell(bellName: "RepeatingBell")
            if(recievedDoRepeat == true){
                dummyDouble = Double(recievedRepeatInterval)
                intervalTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(playIntervalBell), userInfo: nil, repeats: true)
            }
        }
    }
    
    func playEndingBell(){
        playBell(bellName: "EndingBell")
    }
    
    //BtnActions
    
    @IBAction func pausePlayAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if(countdownTimerDidStart){
                pausePlayBtn.setImage(UIImage(named:"play"), for: .normal)
                finishBtn.isHidden = false
                discardSessionBtn.isHidden = false
                countdownTimerDidStart = false
                ProgressBar.pause()
                countdownTimer.pause()
                AudioPlayer.pause()
                intervalTimer.invalidate()
            }else{
                pausePlayBtn.setImage(UIImage(named:"pause"), for: .normal)
                finishBtn.isHidden = true
                discardSessionBtn.isHidden = true
                countdownTimerDidStart = true
                ProgressBar.start()
                countdownTimer.start()
                AudioPlayer.play()
                if(recievedDoRepeat == true){
                    intervalTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(playIntervalBell), userInfo: nil, repeats: true)
                }
            }
        case 2:
            print("")
        case 3:
            print("")
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "meditationActionSelectionSegue"){
            intervalTimer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countdownTimer.delegate = self
        countdownTimer.setTimer(hours: 0, minutes: 0, seconds: recievedCountDownDuration, targetSound: "Sound")
        ProgressBar.setProgressBar(hours: 0, minutes: 0, seconds: recievedCountDownDuration)
        countdownTimer.start()
        ProgressBar.start()
        playAudio()
        dummyDouble = Double(recievedFirstBellDuration)
        intervalTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(playFirstBell), userInfo: nil, repeats: true)
        //intervalTimer = Timer.scheduledTimer(timeInterval: Double(recievedFirstBellDuration), target: self, selector: #selector(playFirstBell), userInfo: nil, repeats: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
