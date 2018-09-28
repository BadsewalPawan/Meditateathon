//
//  ProfileVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 27/08/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var titleArray:Array<String> = ["First name", "Last name", "Email", "Password", "Mobile number", "Birth date", "Gender"]
    
    var valueArray:Array<String> = ["Pawan", "Badsewal", "test@icloud.com", "firebasetest", "7738803432", "05/06/98", "Male"]
    
    @IBOutlet var profileTV: UITableView!
    @IBOutlet var profileImg: UIImageView!
    @IBAction func unwindToProfileVC(_ sender: UIStoryboardSegue) {}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTV.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTVC
        cell.titlelbl.text = titleArray[indexPath.row]
        cell.valuelbl.text = valueArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func signOutUser(){
        do{
            try Auth.auth().signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "loginRegNC")
            self.present(controller, animated: true, completion: nil)
        }catch{
            print("Error while signing out!")
        }
    }
    
    
    @IBAction func editSignOutBBtnActiion(_ sender: UIBarButtonItem) {
        if(sender.tag == 1){
            performSegue(withIdentifier: "editProfileSegue", sender: Any?.self)
        }else{
            signOutUser()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTV.delegate = self
        profileTV.dataSource = self
        profileImg.frame.size.width = profileImg.frame.size.height
        profileImg.layer.cornerRadius = profileImg.frame.size.height / 2
        profileImg.clipsToBounds = true
        profileImg.contentMode = .scaleAspectFill
    }
    
}
