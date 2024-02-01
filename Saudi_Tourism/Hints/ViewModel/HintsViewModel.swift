//
//  HintsViewModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 12/07/1445 AH.
//


import Foundation

class HintsViewModel: ObservableObject {
    // Declare a published property to track the currently selected hint. Views will update when this changes.
    @Published var selectedHint: Place?
    // Declare and initialize a published property for the current level, with a default value of 1.
    @Published var level: Int = 1
    // Declare a constant array to store all hints.
    let allHints: [Place]

    // Declare a constant array to store all hints.
    var hints: [Place] {
        allHints.filter { $0.level == level }
    }

    // Initializer for the class that sets up the hints based on the level.
    init(level: Int) {
        self.level = level // Set the current level to the one provided.

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
        // Set the selected hint to the first hint of the current level.
        selectedHint = hints.first
    }
    
    // Function to select the previous hint in the list for the current level.
    func selectPreviousHint() {
        // Ensure that there is a selected hint and a valid index, then check if we're not at the first hint.
        guard let currentHint = selectedHint, let currentIndex = hints.firstIndex(where: { $0.id == currentHint.id }), currentIndex > 0 else { return }
        // Update the selected hint to the previous hint in the list.
        selectedHint = hints[currentIndex - 1]
    }
    
    // Function to select the next hint in the list for the current level.
    func selectNextHint() {
        // Ensure that there is a selected hint and a valid index, then check if we're not at the last hint.
        guard let currentHint = selectedHint, let currentIndex = hints.firstIndex(where: { $0.id == currentHint.id }), currentIndex < hints.count - 1 else { return }
        selectedHint = hints[currentIndex + 1]
    }
}
