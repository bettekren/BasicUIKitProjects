//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Betül Ekren on 13.03.2025.
//

import Foundation
class SuperMusician : Musicians {
    func SuperMusicianSing() {
        print("I'm a super musician from now on")
    }
    
    override func singAsong() {
        super.singAsong()
        print("I have overridden the method")
    }
    
}
