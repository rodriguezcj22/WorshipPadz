//
//  ViewController.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 3/6/21.
//

import UIKit

import AVFoundation
import MediaPlayer

var padSound = AVAudioPlayer()

let dataSource: [String] = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

//Global tracker to know which cell is currently selected
var indexPathTracker: Int?

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loads the collectionView onto the screen
        collectionViewUI()
    }
    
    func collectionViewUI() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView!)
    }
    
    // Button
    @IBAction func stopButtonAction(_ sender: UIButton) {
        guard indexPathTracker != nil else {
            //debugging line
            print("Cell was not selected. indexPathTracker = empty! ")
            return
        }
        //print("indexPathTracker was NOT empty ! ")
        let ip = IndexPath(item: indexPathTracker!, section: 0)
        
        self.collectionView.deselectItem(at: ip, animated: true)
        indexPathTracker = nil

        if padSound.isPlaying {
            padSound.fadeOut()
        }
    }

    // what happens when the cell is selected
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        //tracks the selected cell and assigns it to 'indexPathTracker'
        indexPathTracker = indexPath.row

        //do - try - catch
        do {
            //selects mp3 matching the note selected - assigns it to padSound
            padSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "\(String(dataSource[indexPath.row]))", ofType: "mp3")!))
            
            padSound.prepareToPlay()
            
            //backgrounPlay feature (do-try-catch)
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSession.Category.playback)
            } catch {
                
            }
            
        }catch {
            Swift.print(error)
        }
        padSound.play()

        //plays infintely
        padSound.numberOfLoops = -1
        
        // debugs
        //print("Selected Note: \(dataSource[indexPath.row])")
    }
}

/* MARK: EXTENSIONS */

extension ViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    //programs the cells
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setup(with: dataSource[indexPath.row])
        cell.noteLabel.font = UIFont(name: "Avenir-Heavy", size: 50)
        
        // Positions noteLabel inside the cell
        let xWidth = cell.noteLabel.frame.width / 8
        let yHeight = cell.noteLabel.frame.height / 4
        let width = cell.noteLabel.frame.width
        let height = cell.noteLabel.frame.height
        
        cell.noteLabel.frame = CGRect(x: xWidth, y: yHeight, width: width, height: height)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    //do not delete - program will fail to build
}

extension AVAudioPlayer {
    @objc func fadeOut() {
        if volume > 0.1 {
            volume -= 0.1
            perform(#selector(fadeOut), with: nil, afterDelay: 0.3)
        } else {
            stop()
            prepareToPlay()
            volume = 1
        }
    }
}
