//
//  courseDetailTVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 17/09/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit

class courseDetailTVC: UITableViewCell {
    
    @IBOutlet var courseAuthorImg: UIImageView!
    @IBOutlet var courseAuthorlbl: UILabel!
    @IBOutlet var courseNetDurationlbl: UILabel!
    @IBOutlet var coursePerDayDurationlbl: UILabel!
    @IBOutlet var courseGenerlbl: UILabel!
    @IBOutlet var courseStudentCountlbl: UILabel!
    @IBOutlet var courseLanguageImg: UIImageView!
    @IBOutlet var courseLanguagelbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
