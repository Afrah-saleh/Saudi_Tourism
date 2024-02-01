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
        selectedHint = hints.first
    }
    
    func selectPreviousHint() {
        guard let currentHint = selectedHint, let currentIndex = hints.firstIndex(where: { $0.id == currentHint.id }), currentIndex > 0 else { return }
        selectedHint = hints[currentIndex - 1]
    }
    
    func selectNextHint() {
        guard let currentHint = selectedHint, let currentIndex = hints.firstIndex(where: { $0.id == currentHint.id }), currentIndex < hints.count - 1 else { return }
        selectedHint = hints[currentIndex + 1]
    }
}
