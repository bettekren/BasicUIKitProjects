//
//  Avatar.swift
//  AvatarBook
//
//  Created by Betül Ekren on 25.03.2025.
//

import Foundation
import UIKit
class AvatarCharacters {
    var name : String
    var feature : String
    var image = UIImage()
    
    init(name: String, feature: String, image: UIImage = UIImage()) {
        self.name = name
        self.feature = feature
        self.image = image
    }
}
