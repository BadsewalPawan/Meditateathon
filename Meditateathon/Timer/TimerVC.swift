//
//  TimerVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 27/08/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit


extension TimerVC:UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1,2:
            return 60
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        switch component {
        case 0:
            return NSAttributedString(string: "\(row) h", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        case 1:
            return NSAttributedString(string: "\(row) m", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        case 2:
            return NSAttributedString(string: "\(row) s", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        default:
            return NSAttributedString(string: "", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        }
    }
    
    func checkForZero(targetComponent:Int, targetElement:Int, firstElement:Int, secondElement:Int) -> Int{
        if(firstElement == 0 && secondElement == 0 && targetElement == 0){
            timePicker.selectRow(1, inComponent:targetComponent, animated:true)
            return 1
        }else{
            return targetElement
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            if(pickerView == timePicker){
                hour = row
                hour = checkForZero(targetComponent: 0, targetElement: hour, firstElement: minutes, secondElement: seconds)
            }else{
                firstBellHour = row
            }
        case 1:
            if(pickerView == timePicker){
                minutes = row
                minutes = checkForZero(targetComponent: 1, targetElement: minutes, firstElement: hour, secondElement: seconds)
            }else{
                firstBellMinutes = row
            }
        case 2:
            if(pickerView == timePicker){
                seconds = row
                seconds = checkForZero(targetComponent: 2, targetElement: seconds, firstElement: hour, secondElement: minutes)
            }else{
                firstBellSeconds = row
            }
        default:
            break;
        }
    }
}

class TimerVC: UIViewController{
    
    
    var hrMinSelected:Bool = true
    var hour:Int = 0
    var minutes:Int = 5
    var seconds:Int = 0
    var sendCountDownDuration:Int!
    //Interval
    var sendDoRepeat:Bool = false
    var firstBellHour:Int = 0
    var firstBellMinutes:Int = 1
    var firstBellSeconds:Int = 0
    var sendRepeatInterval:Int! = 120
    
    
    
    @IBOutlet var timePicker: UIPickerView!
    @IBOutlet var durationBBtn: UIBarButtonItem!
    @IBOutlet var intervalBBtn: UIBarButtonItem!
    @IBOutlet var timerDurationView: UIView!
    //Interval
    @IBOutlet var intervalTimePicker: UIPickerView!
    @IBOutlet var repeatlbl: UILabel!
    @IBOutlet var repeatSlider: UISlider!
    @IBOutlet var repeatBtn: UIButton!
    @IBOutlet var timeIntervalStepper: UIStepper!
    
    //cusomFunc
    
    func switchView(targetView: UIView, targetStatus:Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            targetView.isHidden = targetStatus
        })
    }
    
    func setView(targetBtn: UIButton){
        targetBtn.frame.size.height = targetBtn.bounds.width
    }
    
    @IBAction func timerBBtnAction(_ sender: Any) {
        if((sender as AnyObject).tag == 1){
            durationBBtn.tintColor = .white
            intervalBBtn.tintColor = .lightGray
            switchView(targetView: timerDurationView, targetStatus: false)
        }else{
            intervalBBtn.tintColor = .white
            durationBBtn.tintColor = .lightGray
            switchView(targetView: timerDurationView, targetStatus: true)
        }
    }
    
    @IBAction func showHiddenOpts(_ sender: UIButton) {
        sendDoRepeat = !sendDoRepeat
        if(sendDoRepeat){
            repeatlbl.isHidden = false
            repeatSlider.isHidden = false
            timeIntervalStepper.isHidden = false
            repeatBtn.setImage(#imageLiteral(resourceName: "repeatselected"), for: .normal)
            sendRepeatInterval = Int(repeatSlider.value)
        }else{
            repeatlbl.isHidden = true
            repeatSlider.isHidden = true
            timeIntervalStepper.isHidden = true
            repeatBtn.setImage(#imageLiteral(resourceName: "repeat!selected"), for: .normal)
            sendRepeatInterval = 0
        }
    }
    
    
    @IBAction func setRepeatInterval(_ sender: Any) {
        if((sender as AnyObject).tag == 1){
            sendRepeatInterval = Int(repeatSlider.value)
            timeIntervalStepper.value = Double(repeatSlider.value)
        }else{
            sendRepeatInterval = Int(timeIntervalStepper.value)
            repeatSlider.value = Float(timeIntervalStepper.value)
        }
        repeatlbl.text = "every \(sendRepeatInterval / 60 % 60)m \(sendRepeatInterval % 60)s"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "timerSelectionSegue"){
            let selectionVC = segue.destination as! SelectionVC
            sendCountDownDuration = seconds + (minutes * 60) + (hour * 3600)
            selectionVC.countDownDuration = sendCountDownDuration
            let sendFirstBellDuration:Int = firstBellSeconds + (firstBellMinutes * 60) + (firstBellHour * 3600)
            selectionVC.firstBellDuration = sendFirstBellDuration
            selectionVC.doRepeat = sendDoRepeat
            selectionVC.repeatInterval = sendRepeatInterval
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.delegate = self
        timePicker.dataSource = self
        timePicker.selectRow(5, inComponent:1, animated:false)
        //Interval
        intervalTimePicker.delegate = self
        intervalTimePicker.dataSource = self
        intervalTimePicker.selectRow(1, inComponent:1, animated:false)
        setView(targetBtn: repeatBtn)
    }
    
}
