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
        (number: 1, position: CGPoint(x: 270, y: 520)),
        (number: 2, position: CGPoint(x: 100, y: 490)),
        (number: 3, position: CGPoint(x: 145, y: 325)),
        (number: 4, position: CGPoint(x: 295, y: 310)),
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





