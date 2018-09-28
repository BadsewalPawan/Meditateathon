//
//  GlobalStatsTVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 21/09/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit

class GlobalStatsTVC: UITableViewCell {

    @IBOutlet var globalStatsProfileImg: UIImageView!
    @IBOutlet var globalStatsTimelbl: UILabel!
    @IBOutlet var globalStatslbl: UILabel!
    @IBOutlet var globalStatscourseImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
