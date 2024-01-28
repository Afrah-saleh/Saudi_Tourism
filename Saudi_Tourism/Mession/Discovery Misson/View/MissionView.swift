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
    @State private var showingCongratsPopup = false


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
            if showingPopup, let hintModel = selectedHint {
                            HintPopupView(
                                hintModel: hintModel,
                                isShowing: $showingPopup,
                                onComplete: {
                                    self.startedMissions.insert(hintModel.id)
                                    if hintModel.actionButtonTitle == "Complete" {
                                        // Set showingCongratsPopup to true when a mission is completed
                                        self.showingCongratsPopup = true
                                    }
                                }
                            )
                        }

                        // Add the following block to show the congratulatory popup
                        if showingCongratsPopup {
                            CongratsPopupView(isShowing: $showingCongratsPopup)
                        }
                    
        }
        .navigationBarTitle("Discovery Missions", displayMode: .inline)
    }
}

