//
//  CollectionViewController.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 3/6/21.
//

import UIKit

import AVFoundation
import MediaPlayer

var Cpad = AVAudioPlayer()
var Csharp = AVAudioPlayer()
var Dpad = AVAudioPlayer()
var Dsharp = AVAudioPlayer()
var Epad = AVAudioPlayer()
var Fpad = AVAudioPlayer()
var Fsharp = AVAudioPlayer()
var Gpad = AVAudioPlayer()
var Gsharp = AVAudioPlayer()
var Apad = AVAudioPlayer()
var Asharp = AVAudioPlayer()
var Bpad = AVAudioPlayer()

class CollectionViewController: UICollectionViewController {
    
    // Contains data to supply the collectionview
    let dataSource: [String] = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ADVISE: create a new func that will contain the layout code - and call it here in viewdidload
        
        //print the notification by adding an observer that calls the print function
        
        
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        //Cell Spacing - bottom one [pushes? the footer down]
        //layout.sectionInset = UIEdgeInsets(top: 15, left: 22, bottom: 110, right: 22)
        //padding for cells
        layout.sectionInset = UIEdgeInsets(top: 15, left: 22, bottom: 187, right: 22)
        //bottom - lowers the footer
        
        
        //March 30th: resized the cells to fit them into the screen area
        layout.itemSize = CGSize(width: 100, height: 100)
        
        
        /* LAYOUT HAS THE HEADER AND FOOTER of the collectionView */
        //layout.headerReferenceSize = CGSize(width: 20, height: 100)
        layout.headerReferenceSize = CGSize(width: 20, height: 125)
        //layout.footerReferenceSize = CGSize(width: 20, height: 125)
        layout.footerReferenceSize = CGSize(width: 20, height: 55)
        //line above was missing, and the footer was not visible
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        
        
        // Register LABEL XIB
        let nib = UINib(nibName: "TestCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "testCell")
        
        collectionView.register(HeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
        //footer
        collectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
        
        //BUTTON
        //let viewModel = PausePlayBtnViewModel(title: "Stop")
        //myButton.configure(with: viewModel) //shaped the button
        
        collectionView.addSubview(myButton)
        //myButton.center = view.center
        
        
        //ADVISE: ALL THIS CODE GOES INTO THAT NEW FUNCTION
        //already have the delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        //background color for the app
        
        //let backgroundColor = UIColor()
        //collectionView.backgroundColor = .darkGray //#242424
        
        let bgColor = #colorLiteral(red: 0.0941, green: 0.0941, blue: 0.0941, alpha: 1) /* #181818 */
        collectionView.backgroundColor = bgColor
        
        /*
         esta pagina apreto !!!!
         Swift UIColor Picker
         https://www.ralfebert.de/ios-examples/uikit/swift-uicolor-picker/
         
         */
        
        let volumeView = MPVolumeView(frame: CGRect(x: 20, y: 705, width: 360, height: 30))
        collectionView.addSubview(volumeView)
        
        collectionView.clipsToBounds = true
        view.addSubview(collectionView!)
        
    }
    
    
    let myButton: StopBtn = {
        //BTN POSITIONING
        let stopButton = StopBtn(frame: CGRect(x: 108, y: 590, width: 200, height: 80)) //BTN POSITIONING
        // x has to be the width / 2 , or something like that
        //button.backgroundColor = .blue
        stopButton.setBackgroundImage(#imageLiteral(resourceName: "stopbutton"), for: .normal)
        stopButton.showsTouchWhenHighlighted = true
        //this button = PAUSEPLAYBTN, MY CLASS !!!
        
        //button.addSubview()
        stopButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return stopButton
    }()
    
    //what happens when button is pushed .... delegator?
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        
   
        // A way to stop all the pads with the button, but there has to be a better way
        
        if Cpad.isPlaying || Csharp.isPlaying || Dpad.isPlaying || Dsharp.isPlaying || Epad.isPlaying || Fpad.isPlaying || Fsharp.isPlaying || Gpad.isPlaying || Gsharp.isPlaying || Apad.isPlaying || Asharp.isPlaying || Bpad.isPlaying {
            
            //Cpad.stop()
            Cpad.setVolume(0, fadeDuration: 2.8)
            //and then stop it ! because otherwise it is taking memory resources by runnig at 0 volum
            Csharp.setVolume(0, fadeDuration: 2.8)
            //if volume = 0 {stop this pad}
            Dpad.setVolume(0, fadeDuration: 2.8)
            //if volume = 0 {stop this pad}
            Dsharp.setVolume(0, fadeDuration: 2.8)
            //if volume = 0 {stop this pad}
            Epad.setVolume(0, fadeDuration: 2.8)
            //if volume = 0 {stop this pad}
            Fpad.setVolume(0, fadeDuration: 2.8)
            //if volume = 0 {stop this pad}
            Fsharp.setVolume(0, fadeDuration: 2.8)
            //if volume = 0 {stop this pad}
            Gpad.setVolume(0, fadeDuration: 2.8)
            //if volume = 0 {stop this pad}
            Gsharp.setVolume(0, fadeDuration: 2.8)
            //if volume = 0 {stop this pad}
            Apad.setVolume(0, fadeDuration: 2.8)
            //if volume = 0 {stop this pad}
            Asharp.setVolume(0, fadeDuration: 2.8)
            //if volume = 0 {stop this pad}
            Bpad.setVolume(0, fadeDuration: 2.8)
            //if volume = 0 {stop this pad}
        }
        
        /*
         switch AVAudioPlayer() {
         case Cpad, Csharp, Dpad, Dsharp, Epad, Fpad, Fsharp, Gpad, Gsharp, Apad, Asharp, Bpad:
         print("all of the pads get turned off")
         default:
         print("default action")
         } */
        
        
    } // ACTION BUTTON ENDS
    

    
    //4/27
    var slider: UISlider!
    var label: UILabel!
    //------

    
    //MARK: Methods
    
    //ADVISE: TEST IF I NEED TO USE IT OR NOT
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
        //collectionView?.backgroundColor = .red
    }
    
    /* STAY HERE UNTIL YOU FIGURE OUT HOW TO DISPLAY THE FOOTER !!! */
    //HEADER & FOOTER
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //where do I return the footer to? this is the function where we dequeue sections (header and footer sections)
        
        if kind == UICollectionView.elementKindSectionFooter {
            //RETURN A FOOTER
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath) as! FooterCollectionReusableView
            footer.configure()
            footer.backgroundColor = .darkGray
            
            return footer
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! TestCollectionViewCell
        
        //cell.setup(with: "test")
        cell.setup(with: dataSource[indexPath.row])
        
        cell.noteLabel.textColor = .black //I'M A BEAST BOY !!!!!!
        
        
        //change to whtq SEBASTIAN GAVE ME
        //cell.noteLabel.font = UIFont(name: "ArialRoundedMTBold", size: 35)
        cell.noteLabel.font = UIFont(name: "Avenir-Heavy", size: 35)
        
        
        return cell
        
        /* code to coonsider
         guard let vc = storyboard?.instantiateViewController(identifier: "second") as? MyCollectionViewCell else {
         
         print("failed to get vc from storyboard")
         return
         }
         
         present(vc, animated: true)
         */
        
        // NEW CODE OVER
        
        //}
        //return cell
    }
    
    
    
    //SELECTING A CELL
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        do {
            Cpad = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "C", ofType: "wav")!))
            
            Csharp = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "C#", ofType: "wav")!))
            
            Dpad = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "D", ofType: "wav")!))
            
            Dsharp = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "D#", ofType: "wav")!))
            
            Epad = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "E", ofType: "wav")!))
            
            Fpad = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "F", ofType: "wav")!))
            
            Fsharp = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "F#", ofType: "wav")!))
            
            Gpad = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "G", ofType: "wav")!))
            
            Gsharp = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "G#", ofType: "wav")!))
            
            Apad = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "A", ofType: "wav")!))
            
            Asharp = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "A#", ofType: "wav")!))
            
            Bpad = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "B", ofType: "wav")!))
            
        } catch {
            Swift.print(error)
        } //Main do-catch ENDS
        
        
        
        
        
        
        // prints to console
        print("Selected Note: \(dataSource[indexPath.row])")
        
        
        /* numberOfLoops -> Set a negative integer value to loop the sound continuously until you call the stop method */
        
        let selection = indexPath.row
        
        // ADVISE: CHANGE TO SWITCH CASE
        
        
        switch selection {
        case 0:
            Cpad.play() //make it fade in slowly
            
            /* this is how you make if fade
             func setVolume(Float, fadeDuration: TimeInterval)
             Changes the audio player’s volume over a duration of time.
             
             Cpad.setVolume(0.0, 3) //should set volume to zero over a period of 3 seconds to fade out. to fade it do it the other way around (1.0, 3) //go from zero to one (max)? in 3 seconds */
            
            
            Cpad.numberOfLoops = -1 //left it to see the possibilities
        case 1:
            Csharp.play()
            Csharp.numberOfLoops = -1 //will infinite loop until you stop it .
        case 2:
            Dpad.play()
            Dpad.numberOfLoops = -1
        case 3:
            Dsharp.play()
            Dsharp.numberOfLoops = -1
        case 4:
            Epad.play()
            Epad.numberOfLoops = -1
        case 5:
            Fpad.play()
            Fpad.numberOfLoops = -1
        case 6:
            Fsharp.play()
            Fsharp.numberOfLoops = -1
        case 7:
            Gpad.play()
            Gpad.numberOfLoops = -1
        case 8:
            Gsharp.play()
            Gsharp.numberOfLoops = -1
        case 9:
            Apad.play()
            Apad.numberOfLoops = -1
        case 10:
            Asharp.play()
            Asharp.numberOfLoops = -1
        case 11:
            Bpad.play()
            Bpad.numberOfLoops = -1
        default:
            print("something went wrong")
        }
        
        /*
         
         case 0:
         Cpad.play() //plays from 0.0 because there is fade-in in the audio file
         
         do {
         if Cpad is playing{
         playAtTime= 0.5 seconds
         pad.numberOfLoops = -1 //automatically reaches the end, and goes back to 0.5 until the stopbtn is pressed
         { while (stopButton is not pressed)
         
         
         */
        
         
        
    }
    
    

    /*
    Managing Collection View Interactions
    var delegate: UICollectionViewDelegate?
    The object that acts as the delegate of the collection view.
    protocol UICollectionViewDelegate
    The methods adopted by the object you use to manage user interactions with items in a collection view.
    */
    
    
    
    
    // DESELECTING A CELL
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

        //ADVISE: TRY TO DESELECT BY INDEXPATH
        //COULD AND SHOULD BE WRITTEN BETTER - SHARE SOLUTION
        
        //1. Change the Cell's background color
        let deselectedCell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        deselectedCell.contentView.backgroundColor = UIColor.clear
        
        //2. Fadeout of the music slowly
        //made the app faster
        Cpad.stop()
        Csharp.stop()
        Dpad.stop()
        Dsharp.stop()
        Epad.stop()
        Fpad.stop()
        Fsharp.stop()
        Gpad.stop()
        Gsharp.stop()
        Apad.stop()
        Asharp.stop()
        Bpad.stop()
    }
}



