//
//  HintPopupView.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 12/07/1445 AH.
//

import SwiftUI

struct HintPopupView: View {
    let hintModel: HintPopupModel
        @Binding var isShowing: Bool
        var onComplete: () -> Void

    var body: some View {
        if isShowing {
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    HStack {
                        ZStack {
                            Rectangle()
                                .background(Color(red: 0.16, green: 0.09, blue: 0.06))
                                .frame(width: 35, height: 75)
                            
                            Text("\(hintModel.id)")
                                .foregroundColor(.white)
                                .bold()
                        }
                        .offset(y:-5)
                        
                        Text("traditional medicine")
                          .font(
                            Font.custom("Source Sans Pro", size: 26)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.16, green: 0.09, blue: 0.06))
                        
                        Button(action: {
                            withAnimation {
                                self.isShowing = false
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(Color(.systemGray4))
                        }
                       // .offset(x:17)
                    }
                    
                    Image(hintModel.image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(width:300,height: 250)
                        //.clipped()
                        .offset(y:-30)
                    
                    Text(hintModel.description)
                        .font(.body)
                        .padding([.leading, .trailing, .bottom])
                    
                    Button(action: {
                        // Handle the button action here
                        self.isShowing = false
                        onComplete()
                        // Perform navigation or other actions based on button title
                    }) {
                        Text(hintModel.actionButtonTitle.uppercased())
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding([.leading, .trailing, .bottom])
                }
                .background(Color(red: 0.98, green: 0.96, blue: 0.9))
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.horizontal)
                
                Spacer()
            }
            .background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
            .transition(.opacity)
            .onTapGesture {
                withAnimation {
                    self.isShowing = false
                }
            }
        }
    }
}
