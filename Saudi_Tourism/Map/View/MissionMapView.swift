//
//  MissionMapView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//


import SwiftUI

struct MissionMapView: View {
    @StateObject private var viewModel = MissionMapViewModel()
    var body: some View {
        NavigationView {
        ZStack(alignment: .topLeading) {
                  Image("Map")
                .resizable()
                .frame(width: 380, height: 700) // Example size
                .padding(.leading, 7)
                .scaledToFill()
    
            
            ForEach(viewModel.levelPositions, id: \.number) { level in
                               if viewModel.visibleLevels.contains(level.number) {
                                   NavigationLink(destination: LevelDetailView(viewModel: viewModel, levelNumber: level.number)) {
                                       ZStack {
                                           Image("levels")
                                                .resizable()
                                                .frame(width: 150, height: 150)
                                                
                                            Text("\(level.number)")
                                                .font(.system(size: 24)) // Adjust the font size as needed
                                                .foregroundColor(.white) // Change the text color as needed
                                                .padding(.bottom,10)
                                                .bold() // This modifier makes the text bold
                                            
                                            }
                                            .frame(width: 150, height: 150, alignment: .center) // Ensures the ZStack is the same size as the image
                                            .position(x: level.position.x, y: level.position.y)
                                        
                                   }
                               }
                           }
                       }
                       .navigationBarTitle("Game Map", displayMode: .inline)
                   }
               }
           }
        

#Preview {
    MissionMapView()
}
