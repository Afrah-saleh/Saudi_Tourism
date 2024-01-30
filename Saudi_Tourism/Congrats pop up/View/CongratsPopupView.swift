//
//  CongratsPopupView.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 16/07/1445 AH.
//


import SwiftUI


struct CongratsPopupView: View {
    @Binding var isShowing: Bool
    @ObservedObject var viewModel: MissionMapViewModel
    @ObservedObject var vm: popupViewModel
    let Popup: popupModel


    var body: some View {
        if isShowing {
            VStack {
                Spacer()

                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        Text(Popup.title)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()

                        Button(action: {
                            withAnimation {
                            //    self.isShowing = false
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(Color(.systemGray4))
                        }
                    }
                    
                    Text(Popup.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()

                    Image(Popup.description)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)

                    Button(action: {
                        // Handle the collect button action here
                        self.isShowing = false
                        // Perform additional actions if needed
                    }) {
                        Text(Popup.buttonText.uppercased())
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


