//
//  FooterCollectionReusableView.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 3/30/21.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "FooterCollectionReusableView"
    
    //Image - 4/26 - currently covered by the label BACKGROUNDVIEW color = black
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "footer"))
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
    }()
    
    //Initializer - adds image as a subview
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let footerLabel: UILabel = {
        let label2 = UILabel()
        label2.text = "Powered by Javier Melodico - V1.0"
        label2.font = UIFont(name: label2.font.fontName, size: 22) //22
        label2.backgroundColor = .black
        label2.textAlignment = .center
        label2.textColor = .white
        return label2
    }()
    
 
    
    public func configure(){
        backgroundColor = .systemRed
        addSubview(footerLabel) //Adds label to the footer
        //addSubview(onOff_button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        footerLabel.frame = bounds
        imageView.frame = bounds
        //onOffButton.frame = bounds
    }
}

