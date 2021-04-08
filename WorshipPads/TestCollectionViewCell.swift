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
    }
    
    func setup(with note: String){
        print(" LABELA ---", noteLabel) //eventually delete " LABELA ---"
        noteLabel.text = note
        noteLabel.textColor = .white //3/30, is doing what I intend!
    }
}
