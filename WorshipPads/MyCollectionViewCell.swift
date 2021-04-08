//
//  MyCollectionViewCell.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 3/8/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    static let identifier = "Cell"
    @IBOutlet var btn: UIButton!
    @IBOutlet var labela: UILabel!
    //@IBOutlet var notesLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //notesLabel?.frame = bounds
    }
    
    func setup(with note: String){
        print(" BUTTON----", btn)
        print(" LABELA ---", labela)
        btn.setTitle("TEST TITLE", for: .normal)
        labela.text = note
        //notesLabel.text = note
        //notesPad?.text = note
        print(note)
    }
    
}

