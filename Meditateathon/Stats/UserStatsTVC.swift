//
//  UserStatsTVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 21/09/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit

class UserStatsTVC: UITableViewCell {

    @IBOutlet var frequencylbl: UILabel!
    @IBOutlet var minCountlbl: UILabel!
    @IBOutlet var timeCountlbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
