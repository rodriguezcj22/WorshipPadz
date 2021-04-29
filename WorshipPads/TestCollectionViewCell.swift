//
//  TestCollectionViewCell.swift
//  WorshipPads
//
//  Created by Ivan Evačić on 27.03.2021..
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var noteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        /*
            let redView = UIView(frame: bounds)
            redView.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            backgroundViewImage.frame = bounds
            self.backgroundView = redView
            let blueView = UIView(frame: bounds)
            blueView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1)
            //selectedBackgroundView
            self.selectedBackgroundView = blueView
        */
        
        let backgroundViewImage = UIImageView(frame: bounds)
        backgroundViewImage.image = #imageLiteral(resourceName: "bluebutton")
        self.backgroundView = backgroundViewImage

        //Selected Background View
        let selectedBackgroundViewImage = UIImageView(frame: bounds)
        selectedBackgroundViewImage.image = #imageLiteral(resourceName: "greenbutton")
        self.selectedBackgroundView = selectedBackgroundViewImage
  
    }
    
    func setup(with note: String){
        print(" LABELA ---", noteLabel) //eventually delete " LABELA ---"
        noteLabel.text = note
        noteLabel.textColor = .white //3/30, is doing what I intend!
    }
}
