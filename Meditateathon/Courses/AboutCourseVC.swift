//
//  AboutCourseVC.swift
//  
//
//  Created by Pawan Badsewal on 14/09/18.
//

import UIKit

class AboutCourseVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var nibNames:Array<String> = ["courseImageTVC", "courseHeadingTVC", "courseDetailTVC", "courseDescriptionTVC", "courseAudioRelyTVC", "courseReviewTVC", "courseLessonTVC", "courseAuthorProfileTVC" ]
    
    @IBOutlet var courseTV: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nibNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell = Bundle.main.loadNibNamed("courseImageTVC", owner: self, options: nil)?.first as! courseImageTVC
            cell.courseImage.image = #imageLiteral(resourceName: "courseImg1")
            return cell
        }else if(indexPath.row == 1){
            let cell = Bundle.main.loadNibNamed("courseHeadingTVC", owner: self, options: nil)?.first as! courseHeadingTVC
            
            cell.courseHeadinglbl.adjustsFontSizeToFitWidth = true
            cell.courseHeadinglbl.minimumScaleFactor = 0.1
            return cell
        }else if(indexPath.row == 2){
            let cell = Bundle.main.loadNibNamed("courseDetailTVC", owner: self, options: nil)?.first as! courseDetailTVC
            cell.courseAuthorlbl.adjustsFontSizeToFitWidth = true
            cell.courseNetDurationlbl.adjustsFontSizeToFitWidth = true
            cell.coursePerDayDurationlbl.adjustsFontSizeToFitWidth = true
            cell.courseGenerlbl.adjustsFontSizeToFitWidth = true
            cell.courseStudentCountlbl.adjustsFontSizeToFitWidth = true
            cell.courseLanguagelbl.adjustsFontSizeToFitWidth = true
            return cell
        }else if(indexPath.row == 3){
            let cell = Bundle.main.loadNibNamed("courseDescriptionTVC", owner: self, options: nil)?.first as! courseDescriptionTVC
            
           cell.aboutCourselbl.adjustsFontSizeToFitWidth = true
            return cell
        }else if(indexPath.row == 4){
            let cell = Bundle.main.loadNibNamed("courseAudioReplyTVC", owner: self, options: nil)?.first as! courseAudioReplyTVC
            
            return cell
        }else if(indexPath.row == 5){
            let cell = Bundle.main.loadNibNamed("courseReviewTVC", owner: self, options: nil)?.first as! courseReviewTVC
            return cell
        }else if(indexPath.row == 6){   //indexPath.row == 6
            let cell = Bundle.main.loadNibNamed("courseLessonTVC", owner: self, options: nil)?.first as! courseLessonTVC
            return cell
        }else{
            let cell = Bundle.main.loadNibNamed("courseAuthorProfileTVC", owner: self, options: nil)?.first as! courseAuthorProfileTVC
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 306
        }else if(indexPath.row == 1){
            return 242
        }else if(indexPath.row == 2){
            return 110
        }else if(indexPath.row == 3){
            return 245
        }else if(indexPath.row == 4){
            return 225
        }else if(indexPath.row == 5){
            return 285
        }else if(indexPath.row == 6){
            return 3050
        }
        return 575
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseTV.dataSource = self
        courseTV.delegate = self
    }
    
}
