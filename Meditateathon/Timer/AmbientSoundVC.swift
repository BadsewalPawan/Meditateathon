//
//  AmbientSoundVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 29/08/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit

class AmbientSoundVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var soundNames:Array<String> = ["Moonlight"]
    var soundImages:Array<UIImage> = [#imageLiteral(resourceName: "moonLight"), #imageLiteral(resourceName: "moonLight"), #imageLiteral(resourceName: "moonLight"), #imageLiteral(resourceName: "moonLight"), #imageLiteral(resourceName: "moonLight"), #imageLiteral(resourceName: "moonLight"), #imageLiteral(resourceName: "moonLight")]
    
    @IBOutlet var ambientSoundCV: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print("HI")
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "collectionHeader", for: indexPath) as! AmbientSoundCRV
        header.backgroundColor = .white
        header.soundNamelbl.text = "Moonligth"
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return soundImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AmbientSoundCell", for: indexPath) as! AmbientSoundCVC
        cell.soundImage.image = soundImages[indexPath.row]
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellSize = UIScreen.main.bounds.width / 3 - 13
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionLayout.itemSize = CGSize(width: cellSize, height: cellSize)
        collectionLayout.minimumInteritemSpacing = 3
        ambientSoundCV.collectionViewLayout = collectionLayout
    }
    
}
