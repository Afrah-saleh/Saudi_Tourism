//
//  MissionMapView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//


import SwiftUI

struct MissionMapView: View {
    @StateObject private var viewModel = MissionMapViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Image("Map")
                    .resizable()
                    .frame(width: 380, height: 700) // Example size
                    .padding(.leading, 7)
                    .scaledToFill()
                
                ForEach(viewModel.levelPositions, id: \.number) { level in
                    Group {
                        // If the level is unlocked, show it as a clickable NavigationLink.
                        if viewModel.isLevelUnlocked(level.number) {
                            NavigationLink(destination: LevelDetailView(viewModel: viewModel, levelNumber: level.number)) {
                                LevelIconView(level: level.number, isUnlocked: true)
                            }
                        } else {
                            // If the level is not unlocked, show it as non-clickable and reduce opacity.
                            LevelIconView(level: level.number, isUnlocked: false)
                        }
                    }
                    .position(x: level.position.x, y: level.position.y) // Position each level icon
                }
                
            }
            .navigationBarTitle("Game Map", displayMode: .inline)
        }
    }
}

        

#Preview {
    MissionMapView()
}
