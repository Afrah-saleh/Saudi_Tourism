//
//  HintsViewModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 12/07/1445 AH.
//

import Foundation
class HintsViewModel: ObservableObject {
    @Published var selectedHint: Place?
    let hints: [Place] = [
        Place(name: "Hint 1 \n The life before \n 297", image: "Hint", desc: "Years Ago"),
        Place(name: "Hint2", image: "Hint", desc: ""),
        Place(name: "Hint3 hint 3", image: "Hint", desc: ""),
    ]
    
    init() {
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
