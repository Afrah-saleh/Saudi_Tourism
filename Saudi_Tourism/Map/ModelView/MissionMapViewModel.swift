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
    let maxLevel: Int = 10 // Set this to the maximum number of levels in your game
    
    let levelPositions = [ //representing level numbers and their positions
        (number: 1, position: CGPoint(x: 270, y: 520)),
        (number: 2, position: CGPoint(x: 100, y: 490)),
        (number: 3, position: CGPoint(x: 145, y: 325)),
        (number: 4, position: CGPoint(x: 295, y: 310)),
        // we can add more levels
    ]
    
    // Method to unlock a level. It updates the active level to the highest level unlocked.
    //    func unlockLevel(_ level: Int) {
    //        activeLevel = max(level, activeLevel)
    //    }
    
    func unlockNextLevel() {
        if activeLevel < maxLevel { // Assume maxLevel is the maximum level number
            activeLevel += 1
        }
    }
        //    func unlockLevel(_ level: Int) {
        //           activeLevel = max(level, activeLevel)
        //       }
        
        
        // Method to check if a level is unlocked by comparing it with the active level.
        func isLevelUnlocked(_ level: Int) -> Bool {
            return level <= activeLevel
        }
        
        
        func location(for levelNumber: Int) -> Location? {
            return locations.first { $0.activeLevel == levelNumber }
        }
    }
    
    
    


