//
//  main.swift
//  MusicianClass
//
//  Created by Betül Ekren on 13.03.2025.
//

import Foundation

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violenist
}

/*var musician1 = Musicians()
musician1.name = "Inna"
musician1.age = 28
musician1.instrument = "Violin"
print(musician1.name)
musician1.singAsong()

*/
var musician2 = Musicians(name: "Inna", age: 25, instrument: "Violin", musicianType: .Violenist)
print(musician2.instrument)
print(musician2.type)

var superMusician = SuperMusician(name: "Dennis", age: 30, instrument: "Guitar", musicianType: .LeadGuitar)
superMusician.SuperMusicianSing()
print(superMusician.name)
superMusician.singAsong()


