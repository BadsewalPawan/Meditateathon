//
//  CoursesVCViewController.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 05/09/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit

class CoursesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    let courseRating:Array<Double> = [4.88, 5.0, 5.0, 5.0]
    let courseQuote:Array<String> = ["10 Strategies For Living Un Flow", "Creating Conscious Relationships", "How To Make Peace With The Body You Live In", "Inviting Cooperation During Conflict"]
    let courseAuth:Array<String> = ["CARA BRADLEY", "MANOJ DIAS", "ANDREA WACHTER", "ROSWELL ASONIBE"]
    let courseImage:Array<UIImage> = [#imageLiteral(resourceName: "courseImg1"), #imageLiteral(resourceName: "courseImg2"), #imageLiteral(resourceName: "courseImg3"), #imageLiteral(resourceName: "courseImg4")]
    
    @IBOutlet var coursesCV: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courseImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "courseCell", for: indexPath) as! CoursesCVC
        cell.ratinglbl.text = String(courseRating[indexPath.row])
        cell.quotelbl.text = courseQuote[indexPath.row]
        cell.authlbl.text = courseAuth[indexPath.row]
        cell.courseImg.image = courseImage[indexPath.row]
        
        //Enhancing UI
        
        cell.contentView.layer.cornerRadius = 12
        cell.contentView.layer.borderWidth = 5
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.shadowColor = UIColor.gray.cgColor
        cell.contentView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.contentView.layer.shadowRadius = 10
        cell.contentView.layer.shadowOpacity = 1
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "abouteCourseSegue", sender: Any?.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var cellSize = UIScreen.main.bounds.width - 10
        if(UIScreen.main.bounds.width > 700){
            cellSize = (UIScreen.main.bounds.width / 2) - 20}
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionLayout.itemSize = CGSize(width: cellSize, height: cellSize)
        collectionLayout.minimumLineSpacing = 10
        coursesCV.collectionViewLayout = collectionLayout
        coursesCV.allowsMultipleSelection = false
    }
    
}
