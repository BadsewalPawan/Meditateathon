//
//  courseHeadingTVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 17/09/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit

class courseHeadingTVC: UITableViewCell {
    
    @IBOutlet var courseHeadinglbl: UILabel!
    @IBOutlet var courseAuthorImg: UIImageView!
    @IBOutlet var courseQuotelbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
