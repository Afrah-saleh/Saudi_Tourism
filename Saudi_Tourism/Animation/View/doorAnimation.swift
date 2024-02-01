//
//  doorAnimation.swift
//  MC3
//
//  Created by Muna Aiman Al-hajj on 09/07/1445 AH.
//

import SwiftUI
import Foundation

struct doorAnimation: View {
    
    // State variables to control the animation and view transition.
    @State private var isActive=false // Controls the activation of the transition.
    @State private var size = 1.0 // Initial scale of the door image.
    @State private var opacity = 0.2 // Initial opacity of the door image.
    @Binding var sheetShowing : Bool // Binding to control the presentation of this view.
    @ObservedObject var viewModel: HintsViewModel // View model for hints.
    @ObservedObject var vm: MissionMapViewModel // View model for the mission map.

     var body: some View {
         
         // Check if the transition is active.
         if isActive {
             // If true?, display the LevelDetailView with appropriate data.
             
         LevelDetailView(viewModel: vm, location: LocationsDataService.locations.first { $0.activeLevel == vm.activeLevel } ?? LocationsDataService.locations.first!, levelNumber: vm.activeLevel)
         
         .ignoresSafeArea()
         .tabViewStyle(.automatic)
        // .tabViewStyle(.page)
     } else {
         // If not active, display the door animation.
     ZStack{
         VStack {
         Image("doorAnimation")
                 .resizable()
                 .scaledToFill()
                 .edgesIgnoringSafeArea(.all)
                 .ignoresSafeArea()
         
         }
         .scaleEffect(size)
         .opacity(opacity)
         // Trigger the animation when the view appears.
         .onAppear {
             // Define the animation effect and duration.
         withAnimation(.easeIn(duration: 2.2)) {
         self.size = 2.90
             self.opacity = 2
     }
     }
         
         // Trigger the transition to the LevelDetailView after a delay.
     .onAppear {
     DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
     withAnimation {
     self.isActive = true // Activate the transition.
     }
     }
     }
     .navigationBarBackButtonHidden(true)

     }//zstack
     }//else
     }
     }

