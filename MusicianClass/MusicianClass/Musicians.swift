//
//  Musicians.swift
//  MusicianClass
//
//  Created by Betül Ekren on 13.03.2025.
//

import Foundation
class Musicians {
    
  /*   var name  = ""
    var age = 0
    var instrument = ""
   */
    
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    init(name: String, age: Int, instrument: String, musicianType : MusicianType) {
        self.name = name
        self.age = age
        self.instrument = instrument
        self.type = musicianType
    }
    
    func singAsong() {
        print("The sing is being sung")
    }
    
    private func test() {
        print("Test")
    }
    }

