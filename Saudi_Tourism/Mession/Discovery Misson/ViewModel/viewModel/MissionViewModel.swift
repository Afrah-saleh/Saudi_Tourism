//
//  MissionViewModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 16/07/1445 AH.
//

import Foundation
import SwiftUI

/*
class MissionViewModel: ObservableObject {
    @Published var activeLevel: Int = 1
    var missions: [MissionModel]
    
    var filteredMissions: [MissionModel] {
        self.missions.filter { $0.activeLevel == activeLevel }
    }
    
    init(){
        self.missions = MissionDataService.missions
    }
}
*/


class MissionViewModel: ObservableObject {
    @Published var activeLevel: Int = 1 {
        didSet {
            if activeLevel > missions.count {
                activeLevel = missions.count // Prevent it from going beyond available missions
            }
        }
        
    }
    var missions: [MissionModel]
    
    var filteredMissions: [MissionModel] {
        self.missions.filter { $0.activeLevel <= activeLevel }
    }
    
    // Add this method to advance the level
    func advanceLevel() {
        activeLevel += 1
    }
    
    init(){
        self.missions = MissionDataService.missions
    }
    
    func completeMission(missionId: UUID) {
            if let index = missions.firstIndex(where: { $0.id == missionId }) {
                missions[index].isCompleted = true
            }
        }
}
