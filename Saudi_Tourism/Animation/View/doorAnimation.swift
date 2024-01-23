//
//  doorAnimation.swift
//  MC3
//
//  Created by Muna Aiman Al-hajj on 09/07/1445 AH.
//

import SwiftUI
import Foundation

struct doorAnimation: View {
    
    @State private var isActive=false
    @State private var size = 1.0
    @State private var opacity = 0.2
    @Binding var sheetShowing : Bool
     
     var body: some View {
     if isActive {
            Onboarding1()
         .ignoresSafeArea()
         .tabViewStyle(.automatic)
        // .tabViewStyle(.page)
     } else {
     ZStack{
     
     VStack {
     
         VStack {
         Image("doorAnimation")
                 .resizable()
                 .scaledToFill()
                 .edgesIgnoringSafeArea(.all)
                 .ignoresSafeArea()
         
         }
         .scaleEffect(size)
         .opacity(opacity)
         .onAppear {
         withAnimation(.easeIn(duration: 2.2)) {
         self.size = 2.90
             self.opacity = 2
     }
     }
     }
     .onAppear {
     DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
     withAnimation {
     self.isActive = true
     }
     }
     }
     .navigationBarBackButtonHidden(true)

     }
     }
     }
     }

#Preview {
    doorAnimation(sheetShowing: .constant(true))
}
