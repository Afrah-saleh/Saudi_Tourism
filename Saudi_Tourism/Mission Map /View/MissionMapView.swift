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
        NavigationView {
            ZStack(alignment: .top) { 
                           Image("Map")
                                .resizable()
                               .scaledToFill()
                               .ignoresSafeArea()
                
                    HStack {
                        Dropdownmenue(
                            selection: $selection1,
                            options: [
                                "Riyadh",
                                "Jeddah",
                                "AlUla",
                                "Abha"
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
                    .padding(.top, 35)
                        .offset(x:5)
                 
                // Loop through each level position provided by the view model.
                ForEach(viewModel.levelPositions, id: \.number) { level in
                                   Group {
                                       // Check if the level is unlocked and provide interactive behavior.
                                       if viewModel.isLevelUnlocked(level.number) {
                                               Button(action: {
                                                   self.selectedLevel = Level(id: level.number, title: "")
                                               }) {
                                                   LevelIconView(level: level.number, isUnlocked: true)
                                               }
                                           } else {
                                           LevelIconView(level: level.number, isUnlocked: false)
                                       }
                                   }
                                   .position(x: level.position.x, y: level.position.y)
                               }
                
                // Show popup view if `showPopup` is true.
                               if showPopup {
                                   PopupView(showPopup: $showPopup)
                               }
                NavigationLink(
                    destination: HintsView(viewModel: HintsViewModel(level: viewModel.activeLevel), vm: viewModel)
,
                                    isActive: Binding<Bool>(
                                        get: { self.selectedLevel != nil },
                                        set: { if !$0 { self.selectedLevel = nil } }
                                    ),
                                    label: { EmptyView() }
                                )
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
}


#Preview {
    MissionMapView(viewModel: MissionMapViewModel())
}

