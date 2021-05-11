//
//  HeaderCollectionReusableView.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 3/8/21.
//

import UIKit

class Header: UICollectionReusableView {

    static let identifier = "HeaderCollectionReusableView"
    
    
    private let headerLabel: UILabel = {
        let label1 = UILabel()
        label1.text = "Worship Pads"
        label1.font = UIFont(name: label1.font.fontName, size: 60)
        label1.textAlignment = .center
        label1.textColor = .white
        return label1
    }()

    public func configure(){
        backgroundColor = .systemGreen
        
        addSubview(headerLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.frame = bounds //entirity of this view?
    }
    
    
    
    
    
    //new
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
