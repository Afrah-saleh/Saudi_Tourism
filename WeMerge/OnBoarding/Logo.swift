//
//  Logo.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 21/07/1445 AH.
//

import SwiftUI

struct Logo: View {
    @AppStorage("currentPage") var currentPage = 1
    @State private var isActive = false
    @State private var size = 1.0
    @State private var opacity = 0.2
    @State private var animatedText = ""
    let textToAnimate = "MerGe" // Replace with your text
    
    var body: some View {
        ZStack {
            if self.isActive {
                if currentPage > totalPages{
                    MissionMapView(viewModel: MissionMapViewModel())
                    
                }
                else{
                    Walkthrough()
                }
                
                
            } else {
                Color.BB
                    .ignoresSafeArea()
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                    // .edgesIgnoringSafeArea(.all)
                    
                    Text(animatedText)
                        .font(.title) // Customize the font to match your design
                    // .bold()
                        .transition(.opacity) // Transition for the text appearance
                        .id(animatedText) // Ensures the animation restarts with the view
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 9.0)) {
                        // self.size = 2.90
                        self.opacity = 19
                    }
                    
                    // Start the text animation
                    animateTextIndividually(text: textToAnimate)
                }
                
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            } // ZStack
        } // else
    }
    
    // Function to perform the typing animation
    private func animateTextIndividually(text: String) {
        let characters = Array(text)
        let totalDuration = Double(characters.count) * 0.1 // Duration per character
        
        for (index, character) in characters.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + (totalDuration * Double(index))) {
                animatedText.append(character)
            }
        }
    }
}

#Preview {
    Logo()
}
