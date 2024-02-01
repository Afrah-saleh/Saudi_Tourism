//
//  MissionsViews.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 16/07/1445 AH.
//

import SwiftUI

struct MissionsView: View {
    // Declare an observable object for the view model to manage mission map data.
    @ObservedObject var viewModel: MissionMapViewModel
    // Declare another observable object for the view model to manage individual mission data.
    @ObservedObject var vm: MissionViewModel
    // An integer representing the current level number.
    var levelNumber: Int
    // A state variable that determines whether the detail sheet for a mission is visible.
    @State private var isShowingDetailSheet = false
    // A state variable to hold the currently selected mission, if any.
    @State private var selectedMission: MissionModel? = nil
    // A state variable that indicates whether a congratulations popup should be shown.
    @State private var showingCongratsPopup = false
    // A state variable that indicates whether a stamp board is being shown.
    @State private var isShowingStampBoard = false
    
    let popup: CongratsModel
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.BB
                    .ignoresSafeArea()
                VStack {
                    ScrollView {
                            // Use the filteredMissions property to only show missions for the active level
                            ForEach(vm.filteredMissions) { mission in
                                if mission.activeLevel == levelNumber {

                                ZStack {
                                    Image(mission.image)
                                        .resizable()
                                        .cornerRadius(10)
                                    HStack{
                                        Text(mission.title)
                                            .font(.headline)
                                            .padding()
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .padding(.top, 120)
                                        Spacer()
                                        
                                        
                                        Button("Start"){
                                            self.selectedMission = mission
                                            self.isShowingDetailSheet = true
                                            
                                            print("------*** \(mission.isCompleted)")
                                            print("------ ***\(mission.number)")
                                        }
                                            .frame(width: 100, height: 30)
                                            .bold()
                                            .foregroundColor(.white)
                                            .background(Color(red: 0.88, green: 0.29, blue: 0.12))
                                            .cornerRadius(5)
                                            .padding(.trailing)
                                            .padding(.top, 120)
                                        
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                   // .disabled(!mission.isCompleted && mission.number != vm.filteredMissions.first(where: { !$0.isCompleted })?.number)
                                }//zstack
                                    
                                .padding(.leading)
                                .padding(.trailing)
                                .clipped()
                            }
                                   
                        }
                                
                            
                        }
                    
                    }
                    .navigationTitle("Local Missions \(levelNumber)")
                    .navigationBarBackButtonHidden(true)
                
                
                    .onAppear {
                        // Set the active level to match the level number when the view appears
                        self.vm.activeLevel = levelNumber
                    }
                    .sheet(item: $selectedMission, onDismiss: {
                                // Handle the dismiss if needed
                            }) { mission in
                                MissionDetailSheetView(viewModel: viewModel, vm: vm, mission: mission, isShowing: $isShowingDetailSheet, advanceLevel: {
                                    vm.advanceLevel()
                                }, showCongratsPopup: {
                                    // This closure will be called when the last mission is completed
                                    self.showingCongratsPopup = true
                                })
                                .presentationDetents([.medium])
                            }

                            // Add this part to show the CongratsPopupView
                            if showingCongratsPopup {
                                CongratsPopupView(isShowing: $showingCongratsPopup, popupModel: popup, missionMapViewModel: viewModel)
                            }
                        }
                    }
        }
    }


#Preview {
    MissionsView(viewModel: MissionMapViewModel(), vm: MissionViewModel(), levelNumber: 1, popup: popupDataService.Congrats.first!)
}
