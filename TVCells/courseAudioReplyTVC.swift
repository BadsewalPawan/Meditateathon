//
//  courseAudioReplyTVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 17/09/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit

class courseAudioReplyTVC: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var audioReplyDate:Array<String> = ["15 SEP", "15 SEP", "13 SEP", "11 SEP", "11 SEP", "9 SEP", "7 SEP", "3 SEP", "30 AUG", "27 AUG", "20 AUG"]
    
    @IBOutlet var audioReplyCV: UICollectionView!
    @IBOutlet var audioReplyCountHeaderlbl: UILabel!
    @IBOutlet var audioReplyCountlbl: UILabel!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return audioReplyDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = audioReplyCV.dequeueReusableCell(withReuseIdentifier: "audioReplyCell", for: indexPath as IndexPath) as! audioReplyCVC
        cell.audioPlayBtn.tag = indexPath.row
        cell.audioReplyAuthorImg.image =  #imageLiteral(resourceName: "courseImg1")
        cell.audioReplyDatelbl.text = audioReplyDate[indexPath.row]
        return cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        audioReplyCV.dataSource = self
        audioReplyCV.delegate = self
        audioReplyCV.register(UINib.init(nibName: "audioReplyCVC", bundle: nil), forCellWithReuseIdentifier: "audioReplyCell")
        audioReplyCountHeaderlbl.text = "\(audioReplyDate.count) Audio replies"
        audioReplyCountlbl.text = "This course includes 12 community question and \(audioReplyDate.count) audio replies from cara"
    }
    
}
