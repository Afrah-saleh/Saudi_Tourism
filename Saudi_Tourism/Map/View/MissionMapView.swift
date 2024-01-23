//
//  MissionMapView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//


import SwiftUI

struct MissionMapView: View {
    @StateObject private var viewModel = MissionMapViewModel()
    @State var selection1: String? = "Riyadh"
    @State private var showingPopup = false


    var body: some View {
        NavigationView {
            ZStack(alignment: .top) { // Use ZStack to layer the dropdown over the map
                           Image("Map")
                               //.resizable()
                               .frame(width: 380, height: 700)
                              // .padding(.leading, 7)
                               .padding(.top,75)
                               .scaledToFill()
                               .ignoresSafeArea()
                
                VStack {
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
                                .font(.title)
                        }
                        .padding(15)
                                                
                        //Button
                        Button(action: {
                                    self.showingPopup = true
                                }) {
                                    Image(systemName: "info.square")
                                        .font(.title)
                                }
                                .sheet(isPresented: $showingPopup) {
                                    PopupView(isPresented: self.$showingPopup)
                                }                    }
                }.padding(.top)
                    .foregroundColor(.yellow)
                    .offset(y:-20)
                    
                    ForEach(viewModel.levelPositions, id: \.number) { level in
                        Group {
                            // If the level is unlocked, show it as a clickable NavigationLink.
                            if viewModel.isLevelUnlocked(level.number), let location = viewModel.location(for: level.number) {
                                NavigationLink(destination: LevelDetailView(viewModel: viewModel, location: location, levelNumber: level.number)) {
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
           }
          //  .navigationBarTitle("Game Map", displayMode: .inline)
        .onAppear(){
            requestNotificationPermission()
        }
        
       
    }
    
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
    MissionMapView()
}
