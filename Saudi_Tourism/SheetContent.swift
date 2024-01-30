//
//  SheetContent.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 18/07/1445 AH.
//

import SwiftUI
import Foundation
// Data model for the content to be displayed in the sheet
struct SheetContent {
    let title: String
    let imageName: String
    let description: String
    var number : Int
    var activeLevel: Int
    var isCompleted: Bool = false
}


struct PopupContent {
    let title: String
    let imageName: String
    let description: String
    var number : Int
    var activeLevel: Int
    var isCompleted: Bool = false
}
