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
        (number: 1, position: CGPoint(x: 265, y: 515)),
        (number: 2, position: CGPoint(x: 100, y: 490)),
        (number: 3, position: CGPoint(x: 145, y: 325)),
        (number: 4, position: CGPoint(x: 295, y: 310)),
        (number: 5, position: CGPoint(x: 200, y: 395)),
        // we can add more levels
    ]
    var levelTitles: [Int: String] = [
            1: "I'm Basic Saudi",
            2: "I'm Hard core Saudi",
            3: "I'm Smart Saudi cookie",
            4: "I'm Saudi Godfather",
            5: "I'm final boss Saudi"
            // Add all your levels and their titles here
        ]
    
    func title(forLevelId id: Int) -> String {
        return levelTitles[id] ?? "Unknown Level"
    }
    // Method to unlock a level. It updates the active level to the highest level unlocked.
    func unlockNextLevel() {
        print("Current level before unlocking: \(activeLevel)")
        if activeLevel < maxLevel {
            activeLevel += 1
            print("New level after unlocking: \(activeLevel)")
        }
    }
        
        
        // Method to check if a level is unlocked by comparing it with the active level.
        func isLevelUnlocked(_ level: Int) -> Bool {
            return level <= activeLevel
        }
        
        
        func location(for levelNumber: Int) -> Location? {
            return locations.first { $0.activeLevel == levelNumber }
        }
    }
    
    
    


