//
//  stampsMap.swift
//  WeMerge
//
//  Created by Afrah Saleh on 25/07/1445 AH.
//

import SwiftUI

struct stampsMap: View {
    @ObservedObject var viewModel: MissionMapViewModel
    @State private var navigateToMissionMap = false
    var popupModel: CongratsModel
    var levelNumber: Int
    @Binding var showStamp: Bool
    
    var body: some View {
            NavigationStack {
                ZStack {
                    Color.BB
                        .ignoresSafeArea()
                    Image("Board")

                  //  VStack {
                     //   HStack {
                            Spacer()
                            Button(action: {
                                showStamp = false
                                
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color("BTCOLOR"))
                                    .bold()
                                    .font(.title)
                            }
                            .accessibilityLabel("Close")
                            //.background(Color.red)
                            .padding(.bottom,720)
                            .padding(.leading,320)
                            
                            //.zIndex(1) // Ensure the button is above other content
                        //}
                       // Spacer()
                        
                        
                 //   }
                    
                    
                    let columns: [GridItem] = [
                        GridItem(.flexible(), spacing: -80), // horizontal spacing between images
                        GridItem(.flexible())
                    ]
                    LazyVGrid(columns: columns, spacing: 15) { // Vertical spacing between rows
                        ForEach(1..<popupModel.activeLevel, id: \.self) { level in
                               // Only show levels that are less than the current active level
                               if let image = popupDataService.Congrats.first(where: { $0.activeLevel == level })?.image, !image.isEmpty {
                                   Image(image)
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 127, height: 137)
                            }
                        }
                    }
                    .padding()
                    
               }
                  .navigationTitle("Your Stamps")
                  .navigationBarTitleDisplayMode(.inline)
                  .navigationBarBackButtonHidden(true)
              }
          }
      }

//#Preview {
//    stampsMap(viewModel: MissionMapViewModel(), popupModel: CongratsModel(image: "Stamp1", activeLevel: 4), levelNumber: 1, showStamp: $showStamp )
//}
