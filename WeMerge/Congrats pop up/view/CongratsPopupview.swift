//
//  CongratsPopupview.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 18/07/1445 AH.
//

import SwiftUI

struct CongratsPopupView: View {
    @Binding var isShowing: Bool
    var popupModel: CongratsModel
    @ObservedObject var missionMapViewModel: MissionMapViewModel
    @State private var navigateTostamp = false
    @State private var showstamp = false
    @State private var navigateTomisiionmap = false
    @State private var showmap = false

    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 10) {
                Text("Congrats!")
                    .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .padding(20)
                
                Text("You’ve got your Basic Saudi Stamp!")
                  .font(
                    Font.custom("Source Sans Pro", size: 17)
                      .weight(.semibold)
                  )
                  .multilineTextAlignment(.center)
                
                Image(popupModel.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Button("Collect"){
               //    missionMapViewModel.unlockNextLevel()
                    showstamp = true
                    
                }
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color("BTCOLOR"))
                .foregroundColor(.white)
                .cornerRadius(10)
//                .fullScreenCover(isPresented: $showstamp) {
//                    StampsBoard(viewModel: missionMapViewModel)
//                }
                                .fullScreenCover(isPresented: $showstamp) {
                                    Stamps(viewModel: missionMapViewModel, popupModel: popupModel, levelNumber: missionMapViewModel.activeLevel)
                                }
                
                .padding([.leading, .trailing, .bottom])
            }
            .background(Color("BB"))
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.horizontal)
           // .navigationTitle("Congrats!")
            
            Spacer()
            
            
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
