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

//creates a subclass of UICollectionViewController. Child class is "CollectionViewController"
    
class CollectionViewController: UICollectionViewController {
    
    
    // Contains data to supply the collectionview
    let dataSource: [String] = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        
        
        //ADVISE: create a new func that will contain the layout code - and call it here in viewdidload
        
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
        
  
        
        
        
        
        
        /*
        //4/27
        label = UILabel()
        //draws the frame of the label
        label.frame = CGRect(x: 0, y: 200, width: self.view.frame.width, height: 150)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.blue
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 2
        label.font = UIFont(name: "Copperplate-Bold", size: 32)
        //self.view.addSubview(label)
        collectionView.addSubview(label)
         */
        
        
/* SLIDER - SLIDER - SLIDER - SLIDER - SLIDER - SLIDER - SLIDER - SLIDER - SLIDER */
        /*
        slider = UISlider(frame: CGRect(x: 20, y: 680, width: 360, height: 60))
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 30
        //slider.backgroundColor = .darkGray
        slider.tintColor = UIColor.cyan
        slider.thumbTintColor = UIColor.red
        slider.isContinuous = true
        collectionView.addSubview(slider)
        // -------- */
        
        let volumeView = MPVolumeView(frame: CGRect(x: 20, y: 705, width: 360, height: 30))
        collectionView.addSubview(volumeView)
        
        collectionView.clipsToBounds = true
        view.addSubview(collectionView!)
        
    }
    

    
    
//STOP button
    private let myButton: StopBtn = {
        
                // y - moves the button up and down
        //let button = PausePlayBtn(frame: CGRect(x: 108, y: 600, width: 200, height: 60)) //BTN POSITIONING
        let button = StopBtn(frame: CGRect(x: 108, y: 590, width: 200, height: 80)) //BTN POSITIONING
            // x has to be the width / 2 , or something like that
        //button.backgroundColor = .blue
        button.setBackgroundImage(#imageLiteral(resourceName: "stopbutton"), for: .normal)
        button.showsTouchWhenHighlighted = true
        //this button = PAUSEPLAYBTN, MY CLASS !!!
        //button.addSubview()
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        //button.configure(with: PausePlayBtnViewModel.init(title: "TEST"))
        return button
    }()

//BUTTON ACTION !!!!!!!!!!!!!!!! THAT HAPPENS WHEN YOU TAP THE BUTTON !!
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        
        //function created outside is being called here when the button is tapped
        deselectCell()
        
        //when the button is tapped, change background color to .red
        //myButton.backgroundColor = .red
        
        // A way to stop all the pads with the button, but there has to be a better way
        
        if Cpad.isPlaying || Csharp.isPlaying || Dpad.isPlaying || Dsharp.isPlaying || Epad.isPlaying || Fpad.isPlaying || Fsharp.isPlaying || Gpad.isPlaying || Gsharp.isPlaying || Apad.isPlaying || Asharp.isPlaying || Bpad.isPlaying {
            
                //DESELECT THE CURRENT CELL
                print("Deselect the current note")
            
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

    
    func deselectCell() {
        //print("DESELECT THE CELL")

        //tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        
        let currentCell = collectionView.indexPathsForSelectedItems
        
        print("The current cell to be deselected is: \(currentCell)")
    }
    
    
    
    //4/27
    var slider: UISlider!
    var label: UILabel!
    //------
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    //3 - 31 - 21
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    */

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

/*
    //header - reference size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.width/2)
    }
*/
/*
    //footer - reference size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 100)
    }
*/

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
        
        //add bg color to cell
            //this is the one adding that freaking border to my buttons! FU
        //cell.backgroundColor = .black
        
        //cell.backgroundView.image
        
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

    
    
    //this is the one that displays how the cell looks ! aka, background image! ?? 
    /*override */ func collectionView(_ collectionView: UICollectionView, willDisplay cell: MyCollectionViewCell, forItemAt indexPath: IndexPath) {

        collectionView.backgroundColor = .red
            //cell.backgroundColor = .systemPink
        
    }
    
    //SELECTING A CELL
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let selectedCell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
              //selectedCell.contentView.backgroundColor = UIColor(red: 102/256, green: 255/256, blue: 255/256, alpha: 0.66)
        
  
        
        //2. turn on the players
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
   
        // console
        print("Selected Note: \(dataSource[indexPath.row])")
        

        /*
            Controls the looping behavior of the played audio
         
         Consider the following libraries:
            - AVAudioRecorder - And aobject that records audio data to a file
            - AVMIDIPlayer - an object that plays MIDI data through a system sound module
                    - the iOS system itself has a SOUND MODULE!
            
            - numberOfLoops -> Set a negative integer value to loop the sound continuously until you call the stop method.
         
         
         SEAMLESSLY - with no apparent gaps or spaces between one part and the next
         */
        

        
        /*
         RYAN ROBINSON @RYGROB
         @AUDIO_SYMMETRIC
         AUv3 plugin
         AUv3 host
         @AudioKitPro - twitter - the leading free & open-source iOS/macOS music & audio dev tools. audiokitpro.com proudly powers millions of iOS app installs

         */

        let selection = indexPath.row
        
        // ADVISE: CHANGE TO SWITCH CASE


         switch selection {
             case 0:
                Cpad.play() //make it fade in slowly
                
                /* this is how you make if fade
                 func setVolume(Float, fadeDuration: TimeInterval)
                 Changes the audio player’s volume over a duration of time.
                 
                 Cpad.setVolume(0.0, 3) //should set volume to zero over a period of 3 seconds to fade out. to fade it do it the other way around (1.0, 3) //go from zero to one (max)? in 3 seconds */
                
                
                Cpad.numberOfLoops = 5 //left it to see the possibilities
             case 1:
                Csharp.play()
                Csharp.numberOfLoops = -1 //will infinite loop until you stop it .
             case 2:
                Dpad.play()
                Dpad.numberOfLoops = 5
             case 3:
                Dsharp.play()
                Dsharp.numberOfLoops = 5
             case 4:
                Epad.play()
                Epad.numberOfLoops = 5
             case 5:
                Fpad.play()
                Fpad.numberOfLoops = 5
             case 6:
                Fsharp.play()
                Fsharp.numberOfLoops = 5
             case 7:
                Gpad.play()
                Gpad.numberOfLoops = 5
             case 8:
                Gsharp.play()
                Gsharp.numberOfLoops = 5
             case 9:
                Apad.play()
                Apad.numberOfLoops = 15
             case 10:
                Asharp.play()
                Asharp.numberOfLoops = 5
             case 11:
                Bpad.play()
                Bpad.numberOfLoops = 5
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
        

        /*
        if selection == 0{
            //FADE IN SLOWLY
            Cpad.play()
            Cpad.numberOfLoops = 5 //left it to see the possibilities
                //loops but it stops between loops
                //how do we loop without stopping? solve it 4/9
            //KEEP IT LOOPING
        }else if selection == 1{
            //FADE IN SLOWLY
            Csharp.play()
            Csharp.numberOfLoops = 5
        }else if selection == 2{
            //FADE IN SLOWLY
            Dpad.play()
            Dpad.numberOfLoops = 5
        }else if selection == 3{
            Dsharp.play()
            Dsharp.numberOfLoops = 5
        }else if selection == 4{
            Epad.play()
            Epad.numberOfLoops = 5
        }else if selection == 5{
            Fpad.play()
            Fpad.numberOfLoops = 5
        }else if selection == 7{
            Fsharp.play()
            Fsharp.numberOfLoops = 5
        }else if selection == 8{
            Gpad.play()
            Gpad.numberOfLoops = 5
        }else if selection == 9{
            Gsharp.play()
            Gsharp.numberOfLoops = 5
        }else if selection == 10{
            Apad.play()
            Apad.numberOfLoops = 5
        }else if selection == 11{
            Asharp.play()
            Asharp.numberOfLoops = 5
        }else{
            Bpad.play()
            Bpad.numberOfLoops = 5 
        }
        */
 
    }
    
    // DISELECTING A CELL
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
        //ADVISE: TRY TO DESELECT BY INDEXPATH
        //COULD AND SHOULD BE WRITTEN BETTER - SHARE SOLUTION
        //SET UP GIT TODAY 3/27 - COPY/CLONE - IVAN
        
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



