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

                    }
        
        .navigationBarBackButtonHidden(true)

        }
    }


#Preview {
    MissionsView(viewModel: MissionMapViewModel(), vm: MissionViewModel(), levelNumber: 1)
}
