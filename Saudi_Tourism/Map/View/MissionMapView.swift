//
//  MissionMapView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//


import SwiftUI

struct MissionMapView: View {
    @ObservedObject var viewModel: MissionMapViewModel // Now it's an ObservedObject
    @State var selection1: String? = "Riyadh"
    @State private var showPopup = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) { // Use ZStack to layer the dropdown over the map
                           Image("Map")
                                .resizable()
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

                }.padding(.top, 35)
                    .offset(x:5)
                    
                ForEach(viewModel.levelPositions, id: \.number) { level in
                    Group {
                        if viewModel.isLevelUnlocked(level.number) {
                            NavigationLink(destination: HintsView(viewModel: HintsViewModel(level: level.number), vm: viewModel)) {
                                LevelIconView(level: level.number, isUnlocked: true)
                            }
                        } else {
                            LevelIconView(level: level.number, isUnlocked: false)
                        }
                    }
                    .position(x: level.position.x, y: level.position.y)
                }
                if showPopup {
                    PopupView(showPopup: $showPopup)
                }
                }
           }
        .navigationBarBackButtonHidden(true)

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
    MissionMapView(viewModel: MissionMapViewModel())
}

