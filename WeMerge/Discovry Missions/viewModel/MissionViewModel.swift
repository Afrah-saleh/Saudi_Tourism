//
//  MissionViewModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 16/07/1445 AH.
//

import Foundation
import SwiftUI


class MissionViewModel: ObservableObject {
    @Published var activeLevel: Int = 1 {
        didSet {
            if activeLevel > missions.count {
                activeLevel = missions.count // Prevent it from going beyond available missions
            }
        }
    }
    

    @Published var unlockedMissionNumber: Int = 1 // Add this property
    
    func isLastMission(_ mission: MissionModel) -> Bool {
        guard let lastMissionNumber = missions.filter({ $0.activeLevel == mission.activeLevel }).map({ $0.number }).max() else {
            return false
        }
        return mission.number == lastMissionNumber
    }
    
    var missions: [MissionModel]
    @Published var completedMissionId: UUID? // Add this property
    
    var filteredMissions: [MissionModel] {
        self.missions.filter { $0.activeLevel <= activeLevel }
    }
    
    func advanceLevel() {
        activeLevel += 1
        unlockedMissionNumber += 1 // Unlock the next mission
    }
    
    init() {
        self.missions = MissionDataService.missions
    }
    
    func completeMission(missionId: UUID) {
        if let index = missions.firstIndex(where: { $0.id == missionId }) {
            missions[index].isCompleted = true
            completedMissionId = missionId // Set the completedMissionId
            print("complete mission!!!!")
        }
    }
}
