//
//  courseReviewTVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 17/09/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit

class courseReviewTVC: UITableViewCell {
    
    
    @IBOutlet var firsetNetRatingImg: UIImageView!
    @IBOutlet var secondNetRatingImg: UIImageView!
    @IBOutlet var thirdNetRatingImg: UIImageView!
    @IBOutlet var fourthNetRatingImg: UIImageView!
    @IBOutlet var fifthNetRatingImg: UIImageView!
    @IBOutlet var netRatinglbl: UILabel!
    @IBOutlet var ratingCountlbl: UILabel!
    @IBOutlet var ratedUserImg: UIImageView!
    @IBOutlet var ratedUserNamelbl: UILabel!
    @IBOutlet var ratedUserTimelbl: UILabel!
    @IBOutlet var ratedUserCommentlbl: UILabel!
    @IBOutlet var userFirstRatingImg: UIImageView!
    @IBOutlet var userSecondRatingImg: UIImageView!
    @IBOutlet var userThirdRatingImg: UIImageView!
    @IBOutlet var userFourthRatingImg: UIImageView!
    @IBOutlet var userFifthRatingImg: UIImageView!
    @IBOutlet var readAllReviewBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
