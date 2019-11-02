//
//  statsVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 19/09/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit

class statsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var frequencyStats:Array<String> = ["Daily Statistics", "Weekly Statistics", "Monthly Statistics"]
    var minStats:Array<Double> = [4, 20.5, 120]
    var timeStats:Array<Int> = [2,7,15]
    var courseImages:Array<UIImage> = [#imageLiteral(resourceName: "courseImg1"), #imageLiteral(resourceName: "courseImg2"), #imageLiteral(resourceName: "courseImg3"), #imageLiteral(resourceName: "courseImg4"), #imageLiteral(resourceName: "courseImg1"), #imageLiteral(resourceName: "courseImg2"), #imageLiteral(resourceName: "courseImg3"), #imageLiteral(resourceName: "courseImg4"),  #imageLiteral(resourceName: "courseImg1"), #imageLiteral(resourceName: "courseImg2")]
    
    
    @IBOutlet var statsTV: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return minStats.count + 11  // barChatCell + 10 globalStatsCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0){
            let cell = Bundle.main.loadNibNamed("StatsHeaderTVC", owner: self, options: nil)?.first as! StatsHeaderTVC
            cell.statsHeaderlbl.text = "User Stats"
            return cell
        }else if(indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3){
            let cell = Bundle.main.loadNibNamed("UserStatsTVC", owner: self, options: nil)?.first as! UserStatsTVC
            cell.frequencylbl.text = frequencyStats[indexPath.row - 1]
            cell.minCountlbl.text = String(minStats[indexPath.row - 1])
            cell.timeCountlbl.text = String(timeStats[indexPath.row - 1])
            return cell
        }else if(indexPath.row == 4){
            let cell = Bundle.main.loadNibNamed("GraphStatsTVC", owner: self, options: nil)?.first as! GraphStatsTVC
            let dataEntries = generateDataEntries()
            cell.barChartView.dataEntries = dataEntries
            return cell
        }else if(indexPath.row == 5){
            let cell = Bundle.main.loadNibNamed("StatsHeaderTVC", owner: self, options: nil)?.first as! StatsHeaderTVC
            cell.statsHeaderlbl.text = "Community Stats"
            return cell
        }else{
            let cell = Bundle.main.loadNibNamed("GlobalStatsTVC", owner: self, options: nil)?.first as! GlobalStatsTVC
            cell.globalStatsProfileImg.image = #imageLiteral(resourceName: "userComment")
            cell.globalStatscourseImg.image = courseImages[indexPath.row - 6]
            cell.globalStatsTimelbl.adjustsFontSizeToFitWidth = true
            cell.globalStatsTimelbl.minimumScaleFactor = 0.2
            cell.globalStatslbl.adjustsFontSizeToFitWidth = true
            cell.globalStatslbl.minimumScaleFactor = 0.2
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0 || indexPath.row == 5){
            return 50
        }else if(indexPath.row == 4){
            return 300
        }
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        statsTV.deselectRow(at: indexPath, animated: true)
    }
    
    func generateDataEntries() -> [BarEntry] {
        let colors = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
        var result: [BarEntry] = []
        for i in 0..<32 {
            let value = (arc4random() % 90) + 10
            let height: Float = Float(value) / 100.0
            let formatter = DateFormatter()
            formatter.dateFormat = "d MMM"
            var date = Date()
            date.addTimeInterval(TimeInterval(24*60*60*i))
            result.append(BarEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: formatter.string(from: date)))
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statsTV.delegate = self
        statsTV.dataSource = self
        
    }
    
}
