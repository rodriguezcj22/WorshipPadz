//
//  HeaderCollectionReusableView.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 3/8/21.
//

import UIKit

class Header: UICollectionReusableView {

    static let identifier = "HeaderCollectionReusableView"
    
    //usually .swift will override the storyboard. ask yourself, what's overriding this header? or whatever element is not "listening" (in the non-programming sense) to the storyboard?
    
    /*
    private let headerImageView: UIImageView = {
        let headerImage = UIImageView()
        headerImage.image = #imageLiteral(resourceName: "Header")
        
        return headerImage
    }()
 */
    /*
    private let headerImageView: UIImageView = {
        let headerImage = UIImageView()
        //headerImage.image = #imageLiteral(resourceName: "Header")
        headerImage.backgroundColor = .yellow
        
        return headerImage
    }()
 */
    

    public func configure(){
        //addSubview(headerImageView)
        
    }
    
    /*
    override func layoutSubviews() {
        super.layoutSubviews()
        //headerImageView.frame = bounds
        headerImageView.frame = CGRect(x: 0,
                                       y: 10,
                                       width: 380,
                                       height: 100)
        //headerImageView.clipsToBounds = true
    }
     */
    
    
    //view's position and size
    override func layoutSubviews() {
        super.layoutSubviews()
        //headerImageView.frame = bounds
        /*headerImageView.frame = CGRect(x: 0,
                                       y: 10,
                                       width: 380,
                                       height: 100)
        */
        //headerImageView.clipsToBounds = true
    }
     
    
    
    //new
    
    //1. create a view
    //2. add the view as a subclass of its super
    //3. put color to it
    //4. now it shold show color on the screen
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .yellow
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
}
