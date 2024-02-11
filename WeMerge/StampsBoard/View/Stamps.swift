//
//  Stamps.swift
//  WeMerge
//
//  Created by Afrah Saleh on 24/07/1445 AH.
//

import SwiftUI

struct Stamps: View {
    @ObservedObject var viewModel: MissionMapViewModel
    @State private var navigateToMissionMap = false
    @State private var showMap = false
    var popupModel: CongratsModel
    var levelNumber: Int

    var body: some View {
            NavigationStack {
                ZStack {
                    Color.BB
                        .ignoresSafeArea()
                    Image("Board")

                    VStack {
                        // Button at the top-right corner
//                        HStack {
//                            Spacer()
//                            Button(action: {
//                              // showMap = true
//                            }) {
//                                Image(systemName: "xmark") // SF Symbols 'xmark'
//                                    .foregroundColor(Color("BTCOLOR"))
//                                      .bold()
//                                      .font(.title)
//                            }
//                            .accessibilityLabel("Close")
//                            .offset(x: -20)
//
//                            .zIndex(1) // Ensure the button is above other content
//                        }
//                        Spacer()
//                        
                        // Bottom button
                        HStack {
                            Spacer()
                            Button(action: {
                                showMap = true
                                viewModel.unlockNextLevel()

                            }) {
                                Text("UNLOCK NEXT LEVEL")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .padding()
                                    .background(Color("BTCOLOR"))
                                    .cornerRadius(10)
                            }
                            .padding(.bottom, 100) // Safe area bottom padding
                            Spacer()
                        }
                    }
                    
                    
                    let columns: [GridItem] = [
                        GridItem(.flexible(), spacing: -80), // Small horizontal spacing between images
                        GridItem(.flexible())
                    ]
                    LazyVGrid(columns: columns, spacing: 15) { // Vertical spacing between rows
                        ForEach(1...popupModel.activeLevel, id: \.self) { level in
                            if let image = popupDataService.Congrats.first(where: { $0.activeLevel == level })?.image, !image.isEmpty {
                                Image(image)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 127, height: 137)
                                // Adjust the frame as needed
                            }
                        }
                    }
                    .padding() // Adjust the padding as needed
                    
               }
                  .navigationTitle("Your Stamps")
                  .navigationBarTitleDisplayMode(.inline)
                  .navigationBarBackButtonHidden(true)
                  .navigationDestination(isPresented: $showMap) {
                      MissionMapView(viewModel: viewModel)
                  }
              }
          }
      }

#Preview {
    Stamps(viewModel: MissionMapViewModel(), popupModel: CongratsModel(image: "Stamp1", activeLevel: 4), levelNumber: 1 )
}

