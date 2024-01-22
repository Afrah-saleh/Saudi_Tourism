//
//  MissionMapViewModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import SwiftUI
class MissionMapViewModel: ObservableObject {
    @Published var activeLevel: Int = 1
    var locations: [Location] = LocationsDataService.locations

    let levelPositions = [ //representing level numbers and their positions
        (number: 1, position: CGPoint(x: 282, y: 450)),
        (number: 2, position: CGPoint(x: 170, y: 590)),
        (number: 3, position: CGPoint(x: 40, y: 470)),
        (number: 4, position: CGPoint(x: 220, y: 330)),
        // we can add more levels
    ]

    // Method to unlock a level. It updates the active level to the highest level unlocked.
    func unlockLevel(_ level: Int) {
        activeLevel = max(level, activeLevel)
    }

    // Method to check if a level is unlocked by comparing it with the active level.
    func isLevelUnlocked(_ level: Int) -> Bool {
        return level <= activeLevel
    }
    

       func location(for levelNumber: Int) -> Location? {
           return locations.first { $0.activeLevel == levelNumber }
       }
}





