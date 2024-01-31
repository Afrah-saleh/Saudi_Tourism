//
//  Stamps.swift
//  Saudi_Tourism
//
//  Created by Sahora on 31/01/2024.
//

import Foundation
import SwiftData

@Model
final class Stamps {
    var id : Int
    var lvl : String
    var img : Data?
    
    init(id: Int, lvl: String, img : Data?) {
        self.id = id
        self.lvl = lvl
        self.img = img
    }
    
}


