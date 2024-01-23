//
//  PopupView.swift
//  SlidingIntroScreen
//
//  Created by Muna Aiman Al-hajj on 11/07/1445 AH.
//

import SwiftUI
struct PopupView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            TabView {
                // First page content
                VStack(alignment: .leading, spacing: 10) {
                    Text("Community Guidelines for a Positive and Stylish Experience").bold()
                    Text("1. Warm Welcome")
                    Text("Embrace the vibrant community spirit.\nFoster good vibes and positivity.")
                    // Add other items here...
                }
                .padding()
                
                // Second page content
                VStack(alignment: .leading, spacing: 10) {
                    Text("Locality Phrases you could use with local people").bold()
                    Text("Warm Welcoming")
                    Text("\"Ya Hala Ya Hala Yallah, Inik Tahiyyehum\"")
                    // Add other items here...
                }
                .padding()
                
                // Add more pages here if needed
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(width: 400, height: 800) // Set the desired height for the pages
            
            Button("X") {
                self.isPresented = false
            }
            .offset(x:160, y:-730)
            .bold()
            .font(.largeTitle)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding()
       // .frame(height: 500)
    }
}

