//
//  MissionsViews.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 16/07/1445 AH.
//

import SwiftUI

struct MissionsView: View {
    @ObservedObject var viewModel : MissionMapViewModel
    @ObservedObject var vm: MissionViewModel
    var levelNumber: Int
    @State private var isShowingDetailSheet = false
    @State private var selectedMission: MissionModel?
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.BB
                    .ignoresSafeArea()
                VStack {
                    ScrollView {
                        VStack {
                            // Use the filteredMissions property to only show missions for the active level
                            ForEach(vm.filteredMissions) { mission in
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
                                        Button(action: {
                                            self.selectedMission = mission
                                        }
                                        ) {
                                            Text("Start")
                                                .frame(width: 100, height: 30)
                                                .bold()
                                                .foregroundColor(.white)
                                                .background(Color(red: 0.88, green: 0.29, blue: 0.12))
                                                .cornerRadius(5)
                                                .padding(.trailing)
                                                .padding(.top, 120)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                        .disabled(!mission.isCompleted && mission.id != vm.missions.first(where: { !$0.isCompleted })?.id)

                                    }
                                }
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .clipped()
                                }
                                
                            }
                        }
                    }
                    .navigationTitle("Local Missions \(levelNumber)")
                    
                    .onAppear {
                        // Set the active level to match the level number when the view appears
                        self.vm.activeLevel = levelNumber
                    }
                    //            .sheet(isPresented: $isShowingDetailSheet) {
                    //                if let selectedMission = selectedMission {
                    //                    MissionDetailSheetView(viewModel: viewModel, vm: vm,mission: selectedMission, isShowing: $isShowingDetailSheet)
                    //                }
                    //            }
                    
                    .sheet(item: $selectedMission, onDismiss: {
                        // Handle the dismiss if needed
                    }) { mission in
                        MissionDetailSheetView(viewModel: viewModel, vm: vm, mission: mission, isShowing: $isShowingDetailSheet)
                    }
            
                }
            }
        }
    }

#Preview {
    MissionsView(viewModel: MissionMapViewModel(), vm: MissionViewModel(), levelNumber: 1)
}
