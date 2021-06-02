//
//  CollectionViewController.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 3/6/21.
//

/*
 DONE -> 1.Delete Main.storyboard
 DONE -> 2.Add new view controller,then add collection view and set constraints,then add button and its constraints
 DONE -> 3.Refactor home view controller so it is UIViewController and extends UICollectionViewDelegate and UICollectionViewDataSource
 4.Remove code in home view controller that sets up parts of UI programatically(button etc,background colors of collection view etc etc)
 5.Do all of UI code in storyboard
 6.Add collection view layout code so it looks like it was before
 */

import UIKit

import AVFoundation
import MediaPlayer

var padSound = AVAudioPlayer()


//class UIViewController: UICollectionViewController {

// Contains data to supply the collectionview
let dataSource: [String] = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

//made it global
var indexPathTracker: Int?

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
  
    
    
// UI ELEMENTS

    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewUI()
 
    }

    
    // ------ ** ALL SETTINGS RELATED TO THE UI OF THE COLLECTION VIEW ** --
    func collectionViewUI() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout

        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        //red background
        
        //removed
        //collectionView.backgroundColor = .red
        
        /*
        collectionView.register(Header.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier)
        
        collectionView.register(Footer.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Footer.identifier)
        */
        //add button to collection view
        //collectionView.addSubview(myButton) // 5/16 (commented out)
        //delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //let bgColor = #colorLiteral(red: 0.0941, green: 0.0941, blue: 0.0941, alpha: 1) /* #181818 */
        //collectionView.backgroundColor = bgColor
        //layout - need to fix
        
        view.addSubview(collectionView!)

    }
    
    
    @IBAction func volumeView(_ sender: UISlider!) {
        /*
        let volumeView = MPVolumeView(frame: CGRect(x: 20, y: 705, width: 360, height: 30))
        //add volumeView to collectionView
        collectionView.addSubview(volumeView)
        */
    }
    
    /*     ---- for now there is no button -------
    // button is here
    @IBAction func stopButtonAction(_ sender: UIButton) {
 
        print("Button tapped")
        
        let ip = IndexPath(item: indexPathTracker!, section: 0)
        
        self.collectionView.deselectItem(at: ip, animated: true)
        indexPathTracker = nil
        
        print(" THIS IS INDEX PATH TRACKER ----", indexPathTracker)
        
        //print(" CONTROL CELL VALUE ON BTN CLICK----", self.controlCell)
        if padSound.isPlaying {
            padSound.setVolume(0, fadeDuration: 3)
        }
        //no selector needed because the button was already created on the storyboard
    }
     */
    
    /* no header or footer for now
    //HEADER & FOOTER
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // FOOTER CODE - DELETE IT?
        if kind == UICollectionView.elementKindSectionFooter {
            //RETURN A FOOTER
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Footer.identifier, for: indexPath) as! Footer
            footer.configure()
            footer.backgroundColor = .darkGray
            
            return footer
        }
        
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier, for: indexPath) as! Header
        
        header.configure()
        //header color
        header.backgroundColor = .black
        return header
    }
     */ //no header or footer for now
    
    
    
    
    
    //SELECTING A CELL
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        //this cell needs to be green, because it's the one that was selected
        
        //collectionView.deselectItem(at: indexPath, animated: true)
        
        //study this line
        indexPathTracker = indexPath.row
        
    //most likely will need to delete
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        //cell.defaultAndSelectedBackgroundImages() 6/1
        
        //AUDIO CODE: - Assigns audio file to padSound variable. Catches any errors.
        do {
            padSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "\(String(dataSource[indexPath.row]))", ofType: "wav")!))
            //this does not actually play the sound? it just assigns it to padSound
        }catch {
            Swift.print(error)
        }
        padSound.play()
        //Debugs
        print("Selected Note: \(dataSource[indexPath.row])")
    }
    
    
}



/*
 extension ViewController: UICollectionViewDataSource {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 12
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
         
         cell.configure(with: UIImage(named: "image")!)
         return cell
     }
 }
 
 */










/* --------------- MAY 31st WORKING AREA --------------------*/
extension ViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    //CELL
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //ADVISE: CHECK HOW GUARD WORKS IN COLLECTIONVIEWCELLS
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setup(with: dataSource[indexPath.row])
        cell.noteLabel.font = UIFont(name: "Avenir-Heavy", size: 50)
        
        //---------- Positioning of noteLabel
        let xWidth = cell.noteLabel.frame.width / 8 //moves it to the left
        let yHeight = cell.noteLabel.frame.height / 4
        let width = cell.noteLabel.frame.width
        let height = cell.noteLabel.frame.height
        
        cell.noteLabel.frame = CGRect(x: xWidth, y: yHeight, width: width, height: height)
        //---------- Positioning Code Over
        
        //cell.configure(with: UIImage(named: "")!)
        cell.configure(with: #imageLiteral(resourceName: "bluebutton"))
        return cell
    }
    
    //selected cell
        //code goes here
    
    
    //deselected cell
        //code goes here
    
}













extension ViewController: UICollectionViewDelegateFlowLayout {
    //margin and padding between each cell
    
    //this line was overriding the collection view cells !!!!
    
    /*
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    */
    
}
