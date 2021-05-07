//
//  Protocols.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 5/6/21.
//

import Foundation

protocol PauseBtnDelegate {
    
    var btnWasPressed: Bool { get }
    func didPressedStopBtn()
}
