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
            Place(level: 1, name: "About \n Live it as it is before \n 297", image: "Hint", desc: "Years Ago"),
            Place(level: 1, name: "About \n Feel the Saudi Rhythms", image: "Hint", desc: ""),
            
            
            Place(level: 2, name: "Where \n Local Saudi Stylish \n Fabric", image: "Hint", desc: ""),
            Place(level: 2, name: "Where \n Local Flair Meets Touch \n of Expensive Gold!", image: "Hint", desc: ""),
            
            
            
            Place(level: 3, name: "Where\n  Each Sand Dune Weaves a local Tale", image: "Hint", desc: ""),
            Place(level: 3, name: "About \n Dune Drifts & Desert Dreams", image: "Hint", desc: ""),
            
            Place(level: 4, name: "Where\n Cave mystique merges with the heartbeat of our community.", image: "Hint", desc: ""),
            Place(level: 4, name: "Where \n the Flame of the Desert Illuminates Hearts and Traditions.", image: "Hint", desc: ""),
            
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
