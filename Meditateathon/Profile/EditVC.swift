//
//  EditVC.swift
//  
//
//  Created by Pawan Badsewal on 13/09/18.
//

import UIKit

class EditVC: UIViewController {

    @IBOutlet var firstNameTF: UITextField!
    @IBOutlet var lastNameTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var mobileNumTF: UITextField!
    @IBOutlet var birthDateTF: UITextField!
    @IBOutlet var errorlbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
