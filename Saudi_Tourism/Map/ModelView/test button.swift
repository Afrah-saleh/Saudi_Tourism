//
//  test button.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 13/07/1445 AH.
//

import SwiftUI

struct test_button: View {
    @StateObject var viewModel = MissionMapViewModel()
    @State private var navigateToMissionMap = false // State to control navigation
    
    var body: some View {
        NavigationView {
            VStack {
                // NavigationLink that will activate when navigateToMissionMap is true.
                NavigationLink(destination: MissionMapView(viewModel: viewModel), isActive: $navigateToMissionMap) {
                    EmptyView()
                }
                .hidden()
                
                // A button that unlocks the next level and triggers navigation.
                Button("Unlock Next Level and Go to Mission Map") {
                    viewModel.unlockNextLevel() // Unlock the next level using the viewModel method.
                    navigateToMissionMap = true // Set to true to trigger the NavigationLink.
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    test_button()
}
