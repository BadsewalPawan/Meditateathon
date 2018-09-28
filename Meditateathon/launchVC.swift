//
//  launchVC.swift
//  
//
//  Created by Pawan Badsewal on 08/09/18.
//

import UIKit
import FirebaseAuth


class launchVC: UIViewController {

    var timer:Timer = Timer()
    
    @objc func segue(){
        if Auth.auth().currentUser != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "userProfileTC")
            self.present(controller, animated: true, completion: nil)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "loginRegNC")
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(segue), userInfo: nil, repeats: false)
    }
    
}
