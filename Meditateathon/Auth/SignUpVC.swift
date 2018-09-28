//
//  SignUpVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 25/08/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

var currentUser:User?

extension String {
    func isValidEmail() -> Bool{
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    func trim() -> String{
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}

class SignUpVC: UIViewController, UITextFieldDelegate{

    var txtFieldArray:Array<UITextField>!
    let datePicker = UIDatePicker()
    
    @IBOutlet var firstNameTF: UITextField!
    @IBOutlet var lastNameTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var mobileNumTF: UITextField!
    @IBOutlet var birthDateTF: UITextField!
    @IBOutlet var errorlbl: UILabel!
    
    //keyboardSetUp
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func touchesBegain(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    func setDatePicker(){
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton,doneButton], animated: false)
        birthDateTF.inputAccessoryView = toolbar
        birthDateTF.inputView = datePicker
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        birthDateTF.text! = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func setNumPad(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneNumPad))
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        mobileNumTF.inputAccessoryView = doneToolbar
    }
    
    @objc func doneNumPad(){
        mobileNumTF.resignFirstResponder()
    }
    
    //endKeyboardSetup
    
    func showError(errorMsg: String){
        errorlbl.text = errorMsg
        errorlbl.isHidden = false
    }
    
    @IBAction func loginRegAction(_ sender: UIButton) {
        errorlbl.isHidden = true
        guard let firstName = firstNameTF.text?.trim(), !firstName.isEmpty, let lastName = lastNameTF.text?.trim(), !lastName.isEmpty, let birthDate = birthDateTF.text else{
            showError(errorMsg: "All fields are mandatory")
            return
        }
        guard let userEmail = emailTF.text?.trim(), (emailTF.text?.isValidEmail())! else{
            showError(errorMsg: "Enter valid email")
            return
        }
        guard let userPassword = passwordTF.text?.trim(), userPassword.count > 8 else{
            showError(errorMsg: "Password must be atleast 8 charaters long")
            return
        }
        guard let mobileNum = mobileNumTF.text?.trim(), mobileNum.count == 10 else {
            showError(errorMsg: "Enter valid phone number")
            return
        }
        //databaseAction
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { (user, error) in
            if (user != nil){
                currentUser = Auth.auth().currentUser
                let changeRequest = currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = firstName + " " + lastName
                changeRequest?.commitChanges { error in
                    if let error = error {
                        print("Error While updating")
                        print(error.localizedDescription)
                    } else {
                        // Profile updated.
                    }
                }
                //MoveToProfilePage
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "userProfileTC")
                self.present(controller, animated: true, completion: nil)
            }else{
                self.errorlbl.isHidden = false
                if let signUpError = error?.localizedDescription{
                    self.errorlbl.text = signUpError
                }else{
                    print("SignUp ERROR")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
        setNumPad()
    }
}
