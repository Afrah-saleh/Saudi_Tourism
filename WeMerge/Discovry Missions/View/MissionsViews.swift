//
//  MissionsViews.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 16/07/1445 AH.
//

import SwiftUI

struct MissionsView: View {
    @ObservedObject var viewModel: MissionMapViewModel
    @ObservedObject var vm: MissionViewModel
    var levelNumber: Int
    @State private var isShowingDetailSheet = false
    @State private var selectedMission: MissionModel? = nil
    @State private var showingCongratsPopup = false
    @State private var isShowingStampBoard = false
    //let popup: CongratsModel
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.BB
                    .ignoresSafeArea()
                VStack {
                            // Use the filteredMissions property to only show missions for the active level
                    ForEach(vm.filteredMissions) { mission in
                        if mission.activeLevel == levelNumber {

                                ZStack {
                                    Image(mission.image)
                                        .resizable()
                                        .cornerRadius(10)
                                        .scaledToFit()
                                        .overlay(
                                           mission.number > vm.unlockedMissionNumber ?
                                               Color.black.opacity(0.7) : Color.clear // Darken the image for locked missions
                                               )
                                    HStack{
                                        Text(mission.title)
                                            .font(.headline)
                                            .padding()
                                            .foregroundColor(
                                                mission.number > vm.unlockedMissionNumber ?
                                                    .gray : .white // Darken the text for locked missions
                                            )
                                            .fontWeight(.bold)
                                            .padding(.top, 120)
                                        Spacer()

                                      Button("Start") {
                                          if mission.number <= vm.unlockedMissionNumber {
                                              self.selectedMission = mission
                                              self.isShowingDetailSheet = true
                                          }
                                      }
                                      .frame(width: 100, height: 30)
                                      .bold()
                                      .foregroundColor(.white)
                                      .background(mission.number <= vm.unlockedMissionNumber ? Color("BTCOLOR") : Color.gray) // Disable button if mission number is greater than unlockedMissionNumber
                                      .cornerRadius(5)
                                      .padding(.trailing)
                                      .padding(.top, 120)
                                      .disabled(mission.number > vm.unlockedMissionNumber) // Disable button if mission number is greater than unlockedMissionNumber
                                  }
                                              
                                  .buttonStyle(PlainButtonStyle())
                                
                                }//zstack
                                    
                                .padding(.leading)
                                .padding(.trailing)
                                .clipped()
                            }
                                   
                        }
                    }
                
                
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
                                .presentationDetents([.medium,.large])
                            }

                            // Add this part to show the CongratsPopupView
                if showingCongratsPopup, let congratsPopupModel = popupDataService.Congrats.first(where: { $0.activeLevel == viewModel.activeLevel }) {
                         CongratsPopupView(isShowing: $showingCongratsPopup, popupModel: congratsPopupModel, missionMapViewModel: viewModel)
                     }
                        }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Local Missions")
            .navigationBarBackButtonHidden(true)

                    }
        
        .navigationBarBackButtonHidden(true)

        }
    }


#Preview {
    MissionsView(viewModel: MissionMapViewModel(), vm: MissionViewModel(), levelNumber: 1)
}
