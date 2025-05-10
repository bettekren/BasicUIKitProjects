//
//  ArtClass.swift
//  ArtBook
//
//  Created by Betül Ekren on 13.04.2025.
//

import Foundation
import UIKit
class ArtClass {
    var image = UIImage()
    var artistName : String
    var artName : String
    var year : Int
    init(image: String, artistName: String, artName: String, year: Int) {
        self.image = UIImage()
        self.artistName = artistName
        self.artName = artName
        self.year = year
    }
}
