//
//  SelectionVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 29/08/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit



class SelectionVC: UIViewController{
    
    var countDownDuration:Int! = 300
    var firstBellDuration:Int! = 60
    var repeatInterval:Int! = 60
    var doRepeat:Bool! = false
    
    @IBOutlet var durationBtn: UIButton!
    @IBOutlet var intervalBtn: UIButton!
    @IBOutlet var ambientSoundBtn: UIButton!
    @IBOutlet var bellBtn: UIButton!
    @IBOutlet var timerBBtn: UIBarButtonItem!
    @IBOutlet var presetsBBtn: UIBarButtonItem!
    @IBOutlet var timerSelectionView: UIView!
    @IBAction func unwindToSelectionVC(_ sender: UIStoryboardSegue) {}
    
    
    func switchView(targetView: UIView, targetStatus:Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            targetView.isHidden = targetStatus
        })
    }
    
    
    @IBAction func selectionBtnAction(_ sender: UIButton) {
        switch sender.tag{
        case 1:
            //set duration & interval bell
            performSegue(withIdentifier: "selectionTimerSegue", sender: Any?.self)
        case 2:
            //set song
            performSegue(withIdentifier: "selectionAmbientSoundSegue", sender: Any?.self)
        case 3:
            performSegue(withIdentifier: "selectionMeditationActionSegue", sender: Any?.self)
        default:
            break
        }
    }
    
    @IBAction func selectionBBtnAction(_ sender: UIBarButtonItem) {
        if(sender.tag == 1){
            timerBBtn.tintColor = .white
            presetsBBtn.tintColor = .lightGray
            switchView(targetView: timerSelectionView, targetStatus: false)
        }else{
            presetsBBtn.tintColor = .white
            timerBBtn.tintColor = .lightGray
            switchView(targetView: timerSelectionView, targetStatus: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "selectionMeditationActionSegue"){
            let meditationVC = segue.destination as! MeditationVC
            meditationVC.recievedCountDownDuration = countDownDuration
            meditationVC.recievedDoRepeat = doRepeat
            meditationVC.recievedRepeatInterval = repeatInterval
            meditationVC.recievedFirstBellDuration = firstBellDuration
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let hours = countDownDuration! / 3600
        let minutes = countDownDuration! / 60 % 60
        let seconds = countDownDuration! % 60
        durationBtn.setTitle(String(hours) + "h:" + String(minutes) + "m:" + String(seconds) + "s", for: .normal)
        if(doRepeat){
            intervalBtn.setTitle("\(countDownDuration / repeatInterval) repeating", for: .normal)
        }else if(firstBellDuration == 0){
            intervalBtn.setTitle("None", for: .normal)
        }else{
            intervalBtn.setTitle("1 single", for: .normal)
        }
    }
    
    
    
    
}
