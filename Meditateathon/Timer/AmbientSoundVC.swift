//
//  AmbientSoundVC.swift
//  Meditateathon
//
//  Created by Pawan Badsewal on 29/08/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit
import AVFoundation

class AmbientSoundVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var soundNames:Array<String> = ["BackgroundMusic", "Hymn For The Weekend", "BackgroundMusic", "Hymn For The Weekend", "BackgroundMusic", "Hymn For The Weekend", "BackgroundMusic", "Hymn For The Weekend"]
    var soundImages:Array<UIImage> = [#imageLiteral(resourceName: "moonLight"), #imageLiteral(resourceName: "river"), #imageLiteral(resourceName: "om"), #imageLiteral(resourceName: "birds"), #imageLiteral(resourceName: "moonLight"), #imageLiteral(resourceName: "river"), #imageLiteral(resourceName: "om"), #imageLiteral(resourceName: "birds")]

    
    var AudioPlayer:AVAudioPlayer!
    var sendSelectedSound:String! = "BackgroundMusic"
    
    @IBOutlet var ambientSoundView: UIView!
    @IBOutlet var endingBellBBtn: UIBarButtonItem!
    @IBOutlet var ambientSoundBBtn: UIBarButtonItem!
    @IBOutlet var soundNamelbl: UILabel!
    @IBOutlet var ambientSoundCV: UICollectionView!
    
    //CV
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return soundImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AmbientSoundCell", for: indexPath) as! AmbientSoundCVC
        cell.soundImage.image = soundImages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sendSelectedSound = soundNames[indexPath.row]
        soundNamelbl.text = sendSelectedSound
        let selectedCell = collectionView.cellForItem(at: indexPath)
        selectCell(targetCell: selectedCell!)
        playAudio(targetSound: sendSelectedSound)
    }
    
    
    //custom
    
    func switchView(targetView: UIView, targetStatus:Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            targetView.isHidden = targetStatus
        })
    }
    
    func playAudio(targetSound:String){
        let path = Bundle.main.path(forResource: targetSound, ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do{
            AudioPlayer = try AVAudioPlayer(contentsOf: url)
            AudioPlayer.prepareToPlay()
        }
        catch let error as NSError{
            print(error.description)
        }
        AudioPlayer.numberOfLoops = -1
        AudioPlayer.play()
    }
    
    func selectCell(targetCell:UICollectionViewCell){
        for cell in ambientSoundCV.visibleCells{
            if(targetCell == cell){
                UIView.animate(withDuration: 0.5) {
                    cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                    targetCell.alpha = 1
                }
            }else{
                cell.transform = CGAffineTransform(scaleX: 1, y: 1)
                cell.alpha = 0.5
            }
        }
    }
    
    @IBAction func animateBBtn(_ sender: Any) {
        if((sender as AnyObject).tag == 1){
            ambientSoundBBtn.tintColor = .white
            endingBellBBtn.tintColor = .lightGray
            switchView(targetView: ambientSoundView, targetStatus: false)
        }else{
            endingBellBBtn.tintColor = .white
            ambientSoundBBtn.tintColor = .lightGray
            switchView(targetView: ambientSoundView, targetStatus: true)
            playAudio(targetSound: sendSelectedSound)
            AudioPlayer.pause()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ambientSelectionSegue"){
            let selectionVC = segue.destination as! SelectionVC
            selectionVC.selectedSound = sendSelectedSound
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellSize = UIScreen.main.bounds.width / 3 - 6
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionLayout.itemSize = CGSize(width: cellSize, height: cellSize)
        collectionLayout.minimumInteritemSpacing = 1
        collectionLayout.minimumLineSpacing = 4
        ambientSoundCV.collectionViewLayout = collectionLayout
        ambientSoundCV.allowsMultipleSelection = false
        ambientSoundCV.performBatchUpdates(nil) { (result) in
            self.selectCell(targetCell: self.ambientSoundCV.cellForItem(at: IndexPath(row: 0, section: 0))!)
        }
        soundNamelbl.text = sendSelectedSound
    }
}
