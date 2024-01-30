//
//  HintsViewModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 12/07/1445 AH.
//

import Foundation

class HintsViewModel: ObservableObject {
    @Published var selectedHint: Place?
    @Published var level: Int = 1
    let allHints: [Place]

    var hints: [Place] {
        allHints.filter { $0.level == level }
    }

    init(level: Int) {
        self.level = level
        // Populate allHints with hints for all levels
        allHints = [
            Place(level: 1, name: "Muna", image: "Hint", desc: "Hint 1 Description for Level 1"),
            Place(level: 1, name: "Nada", image: "Hint", desc: "Hint 2 Description for Level 1"),
            Place(level: 1, name: "Noo", image: "Hint", desc: "Hint 3 Description for Level 1"),
            Place(level: 2, name: "Ntty", image: "Hint", desc: "Hint 1 Description for Level 2"),
            Place(level: 2, name: "IOOP", image: "Hint", desc: "Hint 2 Description for Level 2"),
            Place(level: 2, name: "Dont", image: "Hint", desc: "Hint 3 Description for Level 2"),
            Place(level: 3, name: "IOOP", image: "Hint", desc: "Hint 2 Description for Level 3"),
            Place(level: 3, name: "Dont", image: "Hint", desc: "Hint 3 Description for Level 3"),
            // ... Add more hints for additional levels
        ]
        selectedHint = hints.first
    }

    // Update the selectedHint logic to account for the new level-based filtering
    func selectPreviousHint() {
        guard let currentHint = selectedHint, let currentIndex = hints.firstIndex(where: { $0.id == currentHint.id }), currentIndex > 0 else { return }
        selectedHint = hints[currentIndex - 1]
    }
    
    func selectNextHint() {
        guard let currentHint = selectedHint, let currentIndex = hints.firstIndex(where: { $0.id == currentHint.id }), currentIndex < hints.count - 1 else { return }
        selectedHint = hints[currentIndex + 1]
    }
}
