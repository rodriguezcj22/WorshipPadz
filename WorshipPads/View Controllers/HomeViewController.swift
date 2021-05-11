//
//  CollectionViewController.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 3/6/21.
//

import UIKit

import AVFoundation
import MediaPlayer

var padSound = AVAudioPlayer()


class HomeViewcontroller: UICollectionViewController {
    
    
 
// UI ELEMENTS
    
    let myButton: StopBtn = {
        let stopButton = StopBtn(frame: CGRect(x: 108, y: 590, width: 200, height: 80))
        stopButton.setBackgroundImage(#imageLiteral(resourceName: "stopbutton"), for: .normal)
        stopButton.showsTouchWhenHighlighted = true
        stopButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return stopButton
    }()
 
    
    // Contains data to supply the collectionview
    let dataSource: [String] = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    
    var controlCell: Int = 100
    

    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutElementsOnTheScreen()
        setupCollectionViewElements()

        print(" CONTROL CELLL VALUE IN VIEW DID LOAD----", controlCell)
    }
    
    
    
    func layoutElementsOnTheScreen() { //fix this whole shit
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 15, left: 22, bottom: 187, right: 22)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.headerReferenceSize = CGSize(width: 20, height: 120)
        layout.footerReferenceSize = CGSize(width: 20, height: 55)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    }
    
    func setupCollectionViewElements() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "testCell")
        //header
        collectionView.register(Header.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier)
        //footer
        collectionView.register(Footer.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Footer.identifier)
        //add button to collection view
        collectionView.addSubview(myButton)
        //delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        let bgColor = #colorLiteral(red: 0.0941, green: 0.0941, blue: 0.0941, alpha: 1) /* #181818 */
        collectionView.backgroundColor = bgColor
    //layout - need to fix
        let volumeView = MPVolumeView(frame: CGRect(x: 20, y: 705, width: 360, height: 30))
        //add volumeView to collectionView
        collectionView.addSubview(volumeView)
        collectionView.clipsToBounds = true
        //add collectionView to the parent view
        view.addSubview(collectionView!)
    }
    
    


    
    //what happens when button is pushed .... delegator?
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        print(" CONTROL CELL VALUE ON BTN CLICK----", self.controlCell)
        if padSound.isPlaying {
            padSound.setVolume(0, fadeDuration: 3)
        }
        
    } // ACTION BUTTON ENDS
    


    
    //MARK: Methods
    
    //ADVISE: TEST IF I NEED TO USE IT OR NOT
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
        //collectionView?.backgroundColor = .red
    }
    
    //HEADER & FOOTER
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
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
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    //footer
    
    /* -------- THIS IS THE MOST IMPORTANT PART RIGHT NOW OF MY PROJECT -------------- */
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //ADVISE: CHECK HOW GUARD WORKS IN COLLECTIONVIEWCELLS
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! CollectionViewCell
        
        //cell.setup(with: "test")
        cell.setup(with: dataSource[indexPath.row])
        //cell.noteLabel.textColor = .black //I'M A BEAST BOY !!!!!!
        cell.noteLabel.font = UIFont(name: "Avenir-Heavy", size: 35)
        return cell
    }
    

    //SELECTING A CELL
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

         do {
            padSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "\(String(dataSource[indexPath.row]))", ofType: "wav")!))
            
         }catch {
                     Swift.print(error)
                 } //Main do-catch ENDS
                 
         // prints to console
         print("Selected Note: \(dataSource[indexPath.row])")
         
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! CollectionViewCell
        
        if padSound.isPlaying {
            //print(" CPAD IS PLAYING---STOP IT AND CHANGE CELL UI")
            //cell.isSelected = false
            //Cpad.stop()
        } else {
            //print(" CPAD IS NOT PLAYING---PLAY THE CORD AND CHANGE UI ")
            do {
                padSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: (dataSource[indexPath.row]), ofType: "wav")!))
                padSound.play() //delete?
            } catch {
                Swift.print(error)
            }
            //cell.isSelected = true
            //Cpad.play()
        }
    }
}
