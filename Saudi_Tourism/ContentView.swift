//
//  ContentView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MissionMapViewModel
    @ObservedObject var vm: MissionViewModel
    var levelNumber: Int
    @State private var activeSheet: ActiveSheet?
        @State private var isSecondButtonEnabled = false
        @State private var isThirdButtonEnabled = false
        @State private var showingPopup = false
        let popupContent = PopupContent(
            title: "Congratulations!",
            imageName: "star.fill",  // Replace with your actual image asset name
            description: "You've completed the challenge!",
            number: 1,
            activeLevel : 1
        )
        
        var body: some View {
            ZStack {
                // Your main content
                VStack {
                    Button("Show First Sheet") {
                        activeSheet = .first
                    }
                    .padding()
                    
                    Button("Show Second Sheet") {
                        activeSheet = .second
                    }
                    .padding()
                    .disabled(!isSecondButtonEnabled)
                    
                    Button("Show Third Sheet") {
                        activeSheet = .third
                    }
                    .padding()
                    .disabled(!isThirdButtonEnabled)
                }
                
                // Custom popup overlay
                if showingPopup {
                    PopupsView(content: popupContent) {
                        showingPopup = false  // Dismiss the popup
                    }
                }
            }
            .sheet(item: $activeSheet) { item in
                // Switch between sheets
                switch item {
                case .first:
                    LevelUpSheetView(
                        content: SheetContent(title: "First Title", imageName: "firstImage", description: "This is the first description.", number: 1, activeLevel:1),
                        buttonTitle: "Level Up",
                        onDismiss: {
                            self.isSecondButtonEnabled = true
                            self.activeSheet = nil
                        }
                    )
                case .second:
                    LevelUpSheetView(
                        content: SheetContent(title: "Second Title", imageName: "secondImage", description: "This is the second description.", number: 1, activeLevel:1),
                        buttonTitle: "Level Up",
                        onDismiss: {
                            self.isThirdButtonEnabled = true
                            self.activeSheet = nil
                        }
                    )
                case .third:
                    LevelUpSheetView(
                        content: SheetContent(title: "Third Title", imageName: "thirdImage", description: "This is the third description.", number: 1, activeLevel:1),
                        buttonTitle: "Complete",
                        onDismiss: {
                            self.showingPopup = true
                            self.activeSheet = nil  // Dismiss the sheet
                          //  self.showingModal = true  // Trigger the modal presentation// Trigger the popup
                        }
                    )
                }
            }
        }
    }


#Preview {
    ContentView(viewModel: MissionMapViewModel(), vm: MissionViewModel(), levelNumber: 1)
}
