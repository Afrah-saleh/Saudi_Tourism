//
//  MissionView.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 12/07/1445 AH.
//

// PAGE1: MissionView

import SwiftUI

struct Mission: Identifiable {
    let id: Int
    let imageName: String
    let title: String
    let description: String // Added a description property
}

struct MissionView: View {
    let missions: [Mission]
    @State private var showingPopup = false
    @State private var selectedHint: HintPopupModel?
    @State private var startedMissions = Set<Int>()

    var body: some View {
        ZStack {
            Color.BB
                .ignoresSafeArea()
            VStack(spacing: 20) {
                ForEach(missions) { mission in
                    MissionCard(
                        mission: mission,
                        isStarted: startedMissions.contains(mission.id)
                    ) { popupModel in
                        self.selectedHint = popupModel
                        self.showingPopup = true
                    }
                }
            }

            if showingPopup, let hintModel = selectedHint {
                HintPopupView(
                    hintModel: hintModel,
                    isShowing: $showingPopup,
                    onComplete: {
                        self.startedMissions.insert(hintModel.id)
                    }
                )
            }
        }
        .navigationBarTitle("Discovery Missions", displayMode: .inline)
    }
}

