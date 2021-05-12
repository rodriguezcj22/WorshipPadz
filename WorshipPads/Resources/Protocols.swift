//
//  Protocols.swift
//  WorshipPads
//
//  Created by Carlos Rodriguez on 5/6/21.
//

import Foundation


protocol Togglable: AnyObject {
    //mutating func toggle()
    func toggle()

    
    //As its name suggests, the toggle() method is intended to toggle or invert the state of any conforming type, typically by modifying a property of that type.
    
    //The toggle() method is marked with the mutating keyword as part of the Togglable protocol definition, to indicate that the method is expected to mutate the state of a conforming instance when it’s called:
}

/*
 enum OnOffSwitch: Togglable {
     case off, on
     mutating func toggle() {
         switch self {
         case .off:
             self = .on
         case .on:
             self = .off
         }
     }
 }
 var lightSwitch = OnOffSwitch.off
 lightSwitch.toggle()
 // lightSwitch is now equal to .on
 */
