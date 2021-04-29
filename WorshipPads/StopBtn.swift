//
//  PausePlayBtn.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 3/31/21.
//

/*
 
 https://developer.apple.com/documentation/uikit/uibutton
 
 When adding a button to your interface, perform the following steps:
 - Set the type of the button at creation time.
 - Supply a title string or image; size the button appropriately for your content.
 - Connect one or more action methods to the button.
 - Set up Auto Layout rules to govern the size and position of the button in your interface.
 - Provide accessibility information and localized strings.
 */

import UIKit

class StopBtn: UIButton {

    private let myTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private var viewModel: PausePlayBtnViewModel?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
    }
    
    init(with viewModel: PausePlayBtnViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        //add all subviews
        
        addSubviews()
        configure(with: viewModel)
    }
    
    
    
    
    private func addSubviews() {
        guard !myTitleLabel.isDescendant(of: self) else{ //study this line
            return
        }
        addSubview(myTitleLabel)

    }
    
    
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //all traits of the button
    public func configure(with viewModel: PausePlayBtnViewModel) {
        layer.masksToBounds = true
        layer.cornerRadius = 20 //8 originally
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
        layer.borderWidth = 1.5 //shapes it cute

        myTitleLabel.text = viewModel.title //why is this title not showing?
        addSubviews()
    }
    
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //maybe delete
        /*
        myTitleLabel.frame =  CGRect(
            x: 60,
            y: 15,
            width: frame.width-65,
            height: (frame.height-10)/2
        ).integral
        */
        
        myTitleLabel.frame =  CGRect(
            x: 35,
            y: 15,
            width: frame.width-65,
            height: (frame.height-10)/2
        ).integral
        
 
    }
 
    
}



struct PausePlayBtnViewModel {
    let title: String
    //let imageName: String
    
}
