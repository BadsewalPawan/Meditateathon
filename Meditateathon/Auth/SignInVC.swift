//
//  SignInVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 25/08/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit

class SignInVC: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var errorlbl: UILabel!
    @IBAction func unwindToSignInVC(_ sender: UIStoryboardSegue) {}
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func showError(errorMsg: String){
        errorlbl.text = errorMsg
        errorlbl.isHidden = false
    }
    
    @IBAction func loginRegAction(_ sender: UIButton) {
        errorlbl.isHidden = true
        if(sender.tag == 1){
            guard let userEmail = emailTF.text, (emailTF.text?.isValidEmail())! else{
                showError(errorMsg: "Enter valid email")
                return
            }
            guard let userPassword = passwordTF.text, (passwordTF.text?.count)! > 8 else{
                showError(errorMsg: "Password must be atleast 8 charaters long")
                return
            }
            //databaseAction
            
            //MoveToProfilePage
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "userProfileTC")
            self.present(controller, animated: true, completion: nil)
        }else{
            performSegue(withIdentifier: "loginRegSegue", sender: Any?.self)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
