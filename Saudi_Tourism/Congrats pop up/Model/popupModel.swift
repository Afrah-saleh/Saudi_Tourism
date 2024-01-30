//
//  popupModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 18/07/1445 AH.
//

import Foundation

struct popupModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let buttonText: String
    let imageName: String
    var activeLevel: Int
}
