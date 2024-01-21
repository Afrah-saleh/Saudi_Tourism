//
//  Onboarding2.swift
//  MC3
//
//  Created by Muna Aiman Al-hajj on 09/07/1445 AH.
//

import SwiftUI

struct Onboarding2: View {
    var body: some View {
        NavigationView{
        ZStack{
            Color.BB
            Image("hintOnboarding")
                .offset(x:10)
            Image("hintOnboarding")
                .offset(x:-10,y:10)
            
            NavigationLink(destination:ContentView() .navigationBarBackButtonHidden()){
                Text("Skip")
            }
            .offset(x:154,y:-353)
            
            
            Text("???")
                .font(
                    Font.custom("Source Sans Pro", size: 44)
                        .weight(.bold))
                .offset(x:-10)
            Text("By the Hints")
                .font(
                    Font.custom("Source Sans Pro", size: 34)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .offset(y:-260)
            
            NavigationLink(destination:Onboarding3().navigationBarBackButtonHidden()){
                Text("Next")
                    .font(
                        Font.custom("Inter", size: 24)
                            .weight(.medium)
                    )
                    .kerning(2.16)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.91, green: 0.9, blue: 0.84))
                //.padding(.horizontal, 10)
                    .padding(.vertical, 16)
                    .frame(width: 300, alignment: .center)
                    .background(Color(red: 0.16, green: 0.09, blue: 0.06))
                    .cornerRadius(13)
            }
            .offset(y:310)
        }//Zstack
        .edgesIgnoringSafeArea(.all)
    }
            
    }
}

#Preview {
    Onboarding2()
}
