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

      //  NavigationStack {
          //  if isShowing {
                VStack {
                    Spacer()
                    
                    VStack(spacing: 20) {
                    //    HStack {

//                            Spacer()
//                            Text(popupModel.title)
//                                .font(.title)
//                                .fontWeight(.bold)
//                            Spacer()
//                            
//                            Button(action: {
//                                withAnimation {
//                                    self.isShowing = false
//                                }
//                            }) {
//                                Image(systemName: "xmark.circle.fill")
//                                    .font(.title2)
//                                    .foregroundColor(Color(.systemGray4))
//                            }
                     //  }
                        
                        Text(popupModel.desc)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Image(popupModel.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                        Button(popupModel.actionButtonTitle.uppercased()){
                          //  self.isShowing = false
                           missionMapViewModel.unlockNextLevel()
                            showstamp = true
                        }
                        .bold()
                       .frame(minWidth: 0, maxWidth: .infinity)
                       .padding()
                       .background(Color("BTCOLOR"))
                       .foregroundColor(.white)
                       .cornerRadius(10)
                        .fullScreenCover(isPresented: $showstamp) {
                           StampsBoard()
                       }
//                            .navigationDestination(isPresented: $showstamp) {
//                                StampsBoard()
//                            }
                        
//                        Button(action: {
//                            // Here you can call the action associated with the button if you have one in your model
//                            // For example, popupModel.buttonAction?()
//                            self.isShowing = false
//                            missionMapViewModel.unlockNextLevel()
//                            self.isShowingStampBoard = true
//
//                            
//                        }) {
//                            Text(popupModel.actionButtonTitle.uppercased())
//                                .bold()
//                                .frame(minWidth: 0, maxWidth: .infinity)
//                                .padding()
//                                .background(Color.orange)
//                                .foregroundColor(.white)
//                                .cornerRadius(10)
//                        }
                        

                        .padding([.leading, .trailing, .bottom])
                    }
                    .background(Color("BB"))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .navigationTitle("Congrats!")
                    
                    Spacer()
//                        .navigationDestination(isPresented: $isShowingStampBoard) {
//                            StampsBoard()
//                        }
                    
                    
                }
       //     }
       // }
    }
}
