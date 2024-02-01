//
//  ContentView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("TheEnd")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Button("I Rock!"){
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 16)
            .frame(width: 340, alignment: .center)
            .background(.BTCOLOR)
            .cornerRadius(13)
            .offset(y:340)
            .foregroundColor(.white)
        }
    }
}


#Preview {
    ContentView()
}
