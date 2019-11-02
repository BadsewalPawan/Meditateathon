//
//  GraphStatsTVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 15/12/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit
//import SwiftCharts

class GraphStatsTVC: UITableViewCell {
    
    
    @IBOutlet var barChartView: BarChart!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
