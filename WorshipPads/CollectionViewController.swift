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
    
    
    //BUTTON
    private let myButton: PausePlayBtn = {
                // y - moves the button up and down
        //let button = PausePlayBtn(frame: CGRect(x: 108, y: 600, width: 200, height: 60)) //BTN POSITIONING
        let button = PausePlayBtn(frame: CGRect(x: 108, y: 600, width: 200, height: 60)) //BTN POSITIONING
            // x has to be the width / 2 , or something like that
        button.backgroundColor = .blue
        button.showsTouchWhenHighlighted = true
        //this button = PAUSEPLAYBTN, MY CLASS !!!
        
        
        //button.addSubview()
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        //button.configure(with: PausePlayBtnViewModel.init(title: "TEST"))
        return button
    }()
    

    
/* ********************************************************************************************************* */
    
//BUTTON ACTION !!!!!!!!!!!!!!!! THAT HAPPENS WHEN YOU TAP THE BUTTON !!
    @objc func buttonAction(sender: UIButton!) {
     print("Button tapped")
        
        //when the button is tapped, change background color to .red
        //myButton.backgroundColor = .red
        
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
/* ********************************************************************************************************* */
    
    
    


    
    // Contains data to supply the collectionview
    let dataSource: [String] = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


        
        
        //ADVISE: create a new func that will contain the layout code - and call it here in viewdidload
        
        let layout = UICollectionViewFlowLayout()
        
            layout.scrollDirection = .vertical
        
            //Cell Spacing
            layout.sectionInset = UIEdgeInsets(top: 15, left: 22, bottom: 110, right: 22) //padding for cells
            //bottom - lowers the footer
        
        
        //March 30th: resized the cells to fit them into the screen area
        layout.itemSize = CGSize(width: 100, height: 100)
        

/* LAYOUT HAS THE HEADER AND FOOTER of the collectionView */
        //layout.headerReferenceSize = CGSize(width: 20, height: 100)
        layout.headerReferenceSize = CGSize(width: 20, height: 125)
        layout.footerReferenceSize = CGSize(width: 20, height: 125)
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
        let viewModel = PausePlayBtnViewModel(title: "Stop")
        myButton.configure(with: viewModel) //shaped the button
       
        
        
        
        collectionView.addSubview(myButton)
        //myButton.center = view.center
        
        
        
        
        
        //ADVISE: ALL THIS CODE GOES INTO THAT NEW FUNCTION
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .yellow // MAIN BACKGROUND COLOR`
        collectionView.clipsToBounds = true
        view.addSubview(collectionView!)
        

        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
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
        header.backgroundColor = .darkGray
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
        cell.backgroundColor = .black
        
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
    
  
    
    
    
    
    
    
    /*override */ func collectionView(_ collectionView: UICollectionView, willDisplay cell: MyCollectionViewCell, forItemAt indexPath: IndexPath) {
        
        
        //collectionView.backgroundColor = .red
            //cell.backgroundColor = .systemPink
        
        //CollectionViewCell.c
        
    }
    
    
    
    
    
    
    
    
    
    

    
    //SELECTING A CELL
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //1. change background color to the one that you select
        let selectedCell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
              selectedCell.contentView.backgroundColor = UIColor(red: 102/256, green: 255/256, blue: 255/256, alpha: 0.66)
        
        //selectedCell
        
    
        
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
        
        //highlight that dataSurce at indexPath.row)
        
        let selection = indexPath.row
        
        // ADVISE: CHANGE TO SWITCH CASE
        
        if selection == 0{
            //FADE IN SLOWLY
            Cpad.play()
            Cpad.numberOfLoops = 5 //left it to see the possibilities
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



