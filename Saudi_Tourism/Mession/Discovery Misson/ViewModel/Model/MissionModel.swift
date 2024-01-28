//
//  MissionModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 16/07/1445 AH.
//

import Foundation

struct MissionModel: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let description: String
    let actionButtonTitle: String
    var number : Int
    var activeLevel: Int
}
