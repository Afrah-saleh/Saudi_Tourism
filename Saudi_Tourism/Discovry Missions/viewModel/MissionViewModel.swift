//
//  MissionViewModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 16/07/1445 AH.
//

import Foundation
import SwiftUI


class MissionViewModel: ObservableObject {
    @Published var activeLevel: Int = 1
    {
        didSet {
            if activeLevel > missions.count {
                activeLevel = missions.count // Prevent it from going beyond available missions
            }
        }
    }
    
    func isLastMission(_ mission: MissionModel) -> Bool {
            guard let lastMission = missions.last(where: { $0.activeLevel == mission.activeLevel }) else {
                
                return false
                
            }
            return lastMission.id == mission.id
        
        }
    
    var missions: [MissionModel]
    @Published var completedMissionId: UUID? // Add this property
    
    var filteredMissions: [MissionModel] {
        self.missions.filter { $0.activeLevel <= activeLevel }
    }
    
    func advanceLevel() {
        activeLevel += 1
    }
    
    init() {
        self.missions = MissionDataService.missions
    }
    
    func completeMission(missionId: UUID) {
        if let index = missions.firstIndex(where: { $0.id == missionId }) {
            missions[index].isCompleted = true
            completedMissionId = missionId // Set the completedMissionId
        }
    }
}
