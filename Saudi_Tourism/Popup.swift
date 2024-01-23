//
//  Popup.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 11/07/1445 AH.
//

import SwiftUI

struct Popup: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Community Guidelines for a Positive and Stylish Experience")
                .bold()
            // Add your content here
 
            
            Button("X") {
               //Image("systemName: Xmark")
                self.isPresented = false
                
            }
        }
        .padding()
        .frame(width: 300, height: 600)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
    }
}
