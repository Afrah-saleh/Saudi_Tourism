//
//  InfoSheetView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 18/07/1445 AH.
//

import SwiftUI

struct InfoSheetView: View {
    @Binding var selectedLevel: Level?
       @Binding var showHintsView: Bool
       var viewModel: MissionMapViewModel
       var level: Level
       
       var body: some View {
           NavigationView {
               VStack {
                   // Add your level information views here
                   Text("Level \(level.id) Details")
                   
                   Button(action: {
                       showHintsView = true
                   }) {
                       Text("Go to Hints")
                           .foregroundColor(.blue)
                   }
                   .padding()
                   .fullScreenCover(isPresented: $showHintsView) {
                       HintsView(viewModel: HintsViewModel(level: level.id), vm: viewModel)
                   }
                   .padding()
               }
               .toolbar {
                   ToolbarItem(placement: .cancellationAction) {
                       Button("Close") {
                           selectedLevel = nil
                       }
                   }
               }
           }
       }
   }

