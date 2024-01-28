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
    var missions: [MissionModel]
    
    var filteredMissions: [MissionModel] {
        self.missions.filter { $0.activeLevel == activeLevel }
    }
    
    init(){
        self.missions = MissionDataService.missions
    }
}
