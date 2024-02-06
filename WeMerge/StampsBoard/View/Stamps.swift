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
        NavigationStack{
            ZStack {
                Color.BB
                    .ignoresSafeArea()
                Image("Board")
                    Button("X") {
                        showMap = true
                        
                    }
                    .foregroundColor(.BTCOLOR)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                   // .offset(x:165,y:-370)
                    
                                    VStack {
                                        if popupModel.activeLevel == levelNumber {
                                            Image(popupModel.image)
                                                .resizable(resizingMode: .stretch)
                                                .frame(width: 127, height: 137)
                    
                                                .padding( .leading, 199)
                                                .padding( .trailing, 43)
                                            ShareLink(item: "Stamp1", preview: SharePreview("Instafilter image", image: "Stamp1"))
                                                .padding( .bottom, 278)
                                                .padding( .leading, 199)
                                                .padding( .trailing, 43)
                                        }
                    
                                    }
                    
                
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Your Stamps")
            .navigationBarBackButtonHidden(true)
            
            
            .navigationDestination(isPresented: $showMap) {
                MissionMapView(viewModel: viewModel)
            }
        }
    }
}
#Preview {
    Stamps(viewModel: MissionMapViewModel(), popupModel: CongratsModel(image: "Stamp1", activeLevel: 1), levelNumber: 1 )
}

