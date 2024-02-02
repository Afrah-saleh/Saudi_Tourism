//
//  MissionMapView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//


import SwiftUI

struct Level: Identifiable {
    let id: Int
    let title: String
}

struct MissionMapView: View {
    @ObservedObject var viewModel: MissionMapViewModel
    @State var selection1: String? = "Riyadh"
    @State private var showPopup = false
    @State private var selectedLevel: Level?
    @State private var showHintsView = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Map")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                HStack {
                    Dropdownmenue(
                        selection: $selection1,
                        options: [
                            "Riyadh",
                      
                        ]
                    ).padding(.trailing,30)
                    
                    //button 1
                    Button(action: {
                        //  self.action2()
                    }) {
                        Image(systemName: "gift")
                            .foregroundColor(Color("BTCOLOR"))
                            .font(.title)
                    }
                    .padding(15)
                    
                    
                    //Button
                    Button(action: {
                        showPopup = true
                    }) {
                        Image(systemName: "info.square")
                            .foregroundColor(Color("BTCOLOR"))
                            .font(.title)
                    }
                }
                .padding(.bottom, 708)
                .padding(.leading,8)
               // .offset(x:5)
                
                // Loop through each level position provided by the view model.
                ForEach(viewModel.levelPositions, id: \.number) { level in
                    Group {
                        // Check if the level is unlocked and provide interactive behavior.
                        if viewModel.isLevelUnlocked(level.number) {
                            Button(action: {
                                self.selectedLevel = Level(id: level.number, title: "")
                                showHintsView = true
                  
                            }) {
                                
                                LevelIconView(level: level.number, isUnlocked: true)
                            }
                        } else {
                            LevelIconView(level: level.number, isUnlocked: false)
                        }
                    }
                    .position(x: level.position.x, y: level.position.y)
                }
                
                // Conditional NavigationLink for Level 5
                         if let selectedLevel = selectedLevel, selectedLevel.id == 5 {
                             NavigationStack {
                                 ContentView()
                             }
                             
                         } else if showHintsView {
                             NavigationStack {
                                 HintsView(viewModel: HintsViewModel(level: viewModel.activeLevel), vm: viewModel)
                             }
                         }

                
                // Show popup view if `showPopup` is true.
                if showPopup {
                    PopupView(showPopup: $showPopup)
                }
            }
}
        
        .navigationBarBackButtonHidden(true)
        
                       .onAppear {
            requestNotificationPermission()
        }
       
    }
    
    // Private function to request notification permissions.
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted")
            } else {
                print("Notification permission denied")
            }
        }
    }
    func toggleHints() {
      showHintsView.toggle()
    }
}


#Preview {
    MissionMapView(viewModel: MissionMapViewModel())
}

