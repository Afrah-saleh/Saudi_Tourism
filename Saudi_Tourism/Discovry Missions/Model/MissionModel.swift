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
    var isCompleted: Bool = false
}

struct CongratsModel: Identifiable {
    let id = UUID()
    let title: String
    let desc: String
    let image: String
    let actionButtonTitle: String
    var number : Int
    var activeLevel: Int
    var isCompleted: Bool = false

}
