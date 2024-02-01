////
////  InfoSheetView.swift
////  Saudi_Tourism
////
////  Created by Afrah Saleh on 18/07/1445 AH.
////
//
//import SwiftUI
//
//struct InfoSheetView: View {
//    // Use binding to create a two-way connection to the selected level.
//    @Binding var selectedLevel: Level?
//    // Use binding for the boolean to control the showing of the hints view.
//    @Binding var showHintsView: Bool
//    // Reference to the view model to interact with the game's data and logic.
//    var viewModel: MissionMapViewModel
//    // The level data for the current info sheet.
//    var level: Level
//    // The title for the current level.
//    var levelTitle: String
//    
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.BB
//                    .ignoresSafeArea()
//                VStack{
//                    
//                    Text(levelTitle)  // Display the level title at the top of the sheet.
//                        .foregroundColor(.black)
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .padding(.bottom,50)
//                        .padding(.top,40)
//                        .padding(.trailing,60)
//                    
//                    // Create a button that, when tapped, sets showHintsView to true.
//                    Button(action: {
//                        showHintsView = true
//                    }) {
//                            Text("Start")
//                                .foregroundColor(.white)
//                                .fontWeight(.semibold)
//                                .frame(width: 340, height: 57)
//                                .background(Color("BTCOLOR"))
//                                .cornerRadius(15)
//                        }
//
//                    // Present a full-screen cover when showHintsView is true.
//                    .fullScreenCover(isPresented: $showHintsView) {
//                        // The full-screen cover shows the HintsView for the current level.
//                        HintsView(viewModel: HintsViewModel(level: level.id), vm: viewModel)
//                    }
//                    .padding()
//                }
//            }
//        }
//    }
//    
//}
