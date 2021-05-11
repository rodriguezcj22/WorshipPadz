//
//  HeaderCollectionReusableView.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 3/8/21.
//

import UIKit

class Header: UICollectionReusableView {

    static let identifier = "HeaderCollectionReusableView"
    
    private let headerImageView: UIImageView = {
        let headerImage = UIImageView()
        headerImage.image = #imageLiteral(resourceName: "Header")
        
        return headerImage
    }()

    public func configure(){
        addSubview(headerImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //headerImageView.frame = bounds
        headerImageView.frame = CGRect(x: 0,
                                       y: 10,
                                       width: 380,
                                       height: 100)
        //headerImageView.clipsToBounds = true
    }
    
    //new
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
