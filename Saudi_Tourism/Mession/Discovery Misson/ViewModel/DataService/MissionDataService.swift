//
//  MissionDataService.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 16/07/1445 AH.
//

import Foundation

class MissionDataService {
    static let missions: [MissionModel] = [
        MissionModel(title: "traditional medicine", image: "mission1", description: "Description for Mission 1", actionButtonTitle: "Start", activeLevel: 1),
        MissionModel(title: "Mud House Mission", image: "mission2", description: "Description for Mission 2", actionButtonTitle: "Start", activeLevel: 1),
        MissionModel(title: "Saudi Coffee Traditions", image: "mission3", description: "Description for Mission 3", actionButtonTitle: "Start", activeLevel: 1),
        MissionModel(title: "Mud House Mission2", image: "mission2", description: "Description for Mission 3", actionButtonTitle: "Start", activeLevel: 2),
        MissionModel(title: "Saudi Coffee Traditions2", image: "mission3", description: "Description for Mission 4", actionButtonTitle: "Start", activeLevel: 2),
    ]
}
