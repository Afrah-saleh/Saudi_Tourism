//
//  doorAnimation.swift
//  MC3
//
//  Created by Muna Aiman Al-hajj on 09/07/1445 AH.
//

import SwiftUI
import Foundation

struct doorAnimation: View {
    
    @State private var isActive=false
    @State private var size = 1.0
    @State private var opacity = 0.2
    @Binding var sheetShowing : Bool
    @ObservedObject var viewModel: HintsViewModel
    @ObservedObject var vm: MissionMapViewModel

     var body: some View {
         
         if isActive {
         LevelDetailView(viewModel: vm, location: LocationsDataService.locations.first { $0.activeLevel == vm.activeLevel } ?? LocationsDataService.locations.first!, levelNumber: vm.activeLevel)
         
         .ignoresSafeArea()
         .tabViewStyle(.automatic)
     } else {
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
         .onAppear {
         withAnimation(.easeIn(duration: 2.2)) {
         self.size = 2.90
             self.opacity = 2
     }
     }
         
     .onAppear {
     DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
     withAnimation {
     self.isActive = true 
     }
     }
     }
     .navigationBarBackButtonHidden(true)

     }//zstack
     }//else
     }
     }

