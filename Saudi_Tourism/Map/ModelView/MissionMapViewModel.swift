//
//  MissionMapViewModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import SwiftUI

class MissionMapViewModel: ObservableObject {
    @Published var visibleLevels: Set<Int> = [1]
    var isActive: [Int: Bool] = [:]

    let levelPositions = [
        (number: 1, position: CGPoint(x: 282, y: 410)),
        (number: 2, position: CGPoint(x: 170, y: 560)),
        (number: 3, position: CGPoint(x: 30, y: 420)),
        (number: 4, position: CGPoint(x: 220, y: 290)),
        // ... Add more levels as needed
    ]

    init() {
        // Initialize isActive for each level with false
        levelPositions.forEach { level in
            isActive[level.number] = false
        }
    }

    func levelTapped(_ level: Int) {
        // Set the isActive for this level to true to trigger navigation
        isActive[level] = true
    }
    
    func unlockLevel(_ level: Int) {
            visibleLevels.insert(level)
            // You can add additional logic here to update the state of the GameMapView if needed
        }
}





