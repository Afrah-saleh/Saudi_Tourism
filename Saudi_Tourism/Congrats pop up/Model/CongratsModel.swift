//
//  popupModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 18/07/1445 AH.
//

import Foundation

struct CongratsModel: Identifiable {
    let id = UUID()
    let image: String
    var activeLevel: Int
    var isCompleted: Bool = false
    
}

