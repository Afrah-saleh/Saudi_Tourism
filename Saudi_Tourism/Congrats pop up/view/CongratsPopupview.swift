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

    var body: some View {
        if isShowing {
            VStack {
                Spacer()

                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        Text(popupModel.title)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()

                        Button(action: {
                            withAnimation {
                                self.isShowing = false
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(Color(.systemGray4))
                        }
                    }
                    
                    Text(popupModel.desc)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()

                    Image(popupModel.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)

                    Button(action: {
                        // Here you can call the action associated with the button if you have one in your model
                        // For example, popupModel.buttonAction?()
                        self.isShowing = false
                        missionMapViewModel.unlockNextLevel()

                    }) {
                        Text(popupModel.actionButtonTitle.uppercased())
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding([.leading, .trailing, .bottom])
                }
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.horizontal)

                Spacer()
            }
            .background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
            .transition(.opacity)
        }
    }
}

