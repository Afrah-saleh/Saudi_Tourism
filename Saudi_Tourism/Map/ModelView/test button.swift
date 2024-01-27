//
//  test button.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 13/07/1445 AH.
//

import SwiftUI

struct test_button: View {
    @ObservedObject var viewModel: MissionMapViewModel
    @State private var navigateToMissionMap = false // State to control navigation
    @State private var showMap = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Current level: \(viewModel.activeLevel)")
                Button("Unlock Next Level") {
                    
                    viewModel.unlockNextLevel()
                    
                    // Show map view
                    showMap = true
                    
                }
                
            }
            .fullScreenCover(isPresented: $showMap) {
                MissionMapView(viewModel: viewModel)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    test_button(viewModel: MissionMapViewModel())
}
