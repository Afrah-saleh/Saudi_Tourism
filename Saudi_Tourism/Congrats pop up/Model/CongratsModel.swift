//
//  popupModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 18/07/1445 AH.
//

import Foundation

struct CongratsModel: Identifiable {
    let id = UUID()
    let title: String
    let desc: String
    let image: String
    let actionButtonTitle: String
    var activeLevel: Int
    var isCompleted: Bool = false
    var number: Int

}

