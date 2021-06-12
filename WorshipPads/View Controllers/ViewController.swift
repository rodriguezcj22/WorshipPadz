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
 DONE -> 4.Remove code in home view controller that sets up parts of UI programatically(button etc,background colors of collection view etc etc)
 DONE -> 5.Do all of UI code in storyboard
 6.Add collection view layout code so it looks like it was before
 */

import UIKit

import AVFoundation
import MediaPlayer

var padSound = AVAudioPlayer()
//hackingwithswift: var bombSoundEffect: AVAudioPlayer?

let dataSource: [String] = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

//made it global
var indexPathTracker: Int?

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
  
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //only list instructions in viewDidLoad()
        collectionViewUI()
    }
    
    // ------ ** ALL SETTINGS RELATED TO THE UI OF THE COLLECTION VIEW ** --
    func collectionViewUI() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout

        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        //delegates
        collectionView.delegate = self
        collectionView.dataSource = self
  
        view.addSubview(collectionView!)
    }
    
    

    

    
    
    
    //bool flag
    var stopBtnWasPressed: Bool = false
    
    
    // button is here
    @IBAction func stopButtonAction(_ sender: UIButton) {
 
        guard indexPathTracker != nil else {
                print("Cell was not selected. indexPathTracker = empty! ")
                return
        }
        print("indexPathTracker was NOT empty ! ")
        
        
        let ip = IndexPath(item: indexPathTracker!, section: 0)

        self.collectionView.deselectItem(at: ip, animated: true)
        indexPathTracker = nil
        
        print(" THIS IS INDEX PATH TRACKER ----", indexPathTracker)
        
        //print(" CONTROL CELL VALUE ON BTN CLICK----", self.controlCell)
        if padSound.isPlaying {

            padSound.fadeOut()
            
        }
    }
    
    
    
    
    
    
    
 
    
    
    
    
    
    //SLIDER:
    
    //initialize a sliderValue tracker (not nil, won't crash, right?)
    
    //var sliderValue: Float = 0.8000000
    
/*
    
    @IBAction func volumeSlider(_ sender: UISlider!) {

        //track the current slider value
        sliderValue = sender.value
        
        padSound.volume = sender.value
        print("VolumeView: ", sender.value)
        
        

        
        //if stop button was pressed
        /*
         Set a boolean flag to true inside levelOneCompleted():

         var isLevelOneCompleted = false

         func levelOneCompleted(){
             // do things...
             isLevelOneCompleted = true
         }
         And later...

         if isLevelOneCompleted {
             //do this
         } else {
             //do this
         }
         */
        
        if stopBtnWasPressed {
            
            
        }
        
        //sender.isHidden = false
        
        //if isLevelOneCompleted //set the bool flag back 0
        //check for some condition, or wait some time and then execute
        //stopBtnWasPressed = false
        
        print("the code executed passed the if statement")
        
        
        
    }
    
    
*/
    
    

    //SPEED DEBUGGING HERE !!!!!!!: SELECTING A CELL
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {


        //study this line
        indexPathTracker = indexPath.row

        //AUDIO CODE: - Assigns audio file to padSound variable. Catches any errors.
        do {
            
            padSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "\(String(dataSource[indexPath.row]))", ofType: "mp3")!))
            
            //was missing this line
            padSound.prepareToPlay() //needed?
            
            //backgrounPlay
            
            var audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSession.Category.playback)
            } catch {
                
            }
        }catch {
            Swift.print(error)
        }
        padSound.play()
        padSound.numberOfLoops = -1
        
        //Debugs
        //print("Selected Note: \(dataSource[indexPath.row])")
    }
}


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
        
        //---------- Positioning of noteLabel NOTELABEL !!! INSIDE CELL
        let xWidth = cell.noteLabel.frame.width / 8 //moves it to the left
        let yHeight = cell.noteLabel.frame.height / 4
        let width = cell.noteLabel.frame.width
        let height = cell.noteLabel.frame.height
        
        cell.noteLabel.frame = CGRect(x: xWidth, y: yHeight, width: width, height: height)
         
        //---------- Positioning Code Over

        return cell
    }
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

//first try it as is
//if doesn't work, try: pad.volume() >
extension AVAudioPlayer {
    @objc func fadeOut() {
        if volume > 0.1 {
            
            //disable the slider, then fade
            //how do I disable the fader?
            //bring the "volumeSlider" here somewhow
            
            // Fade
            volume -= 0.1
            perform(#selector(fadeOut), with: nil, afterDelay: 0.3)
        } else {
            // Stop and get the sound ready for playing again
            stop()
            prepareToPlay()
            volume = 1
        }
    }
}

