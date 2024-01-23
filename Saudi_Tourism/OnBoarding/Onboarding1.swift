//
//  Onboarding1.swift
//  MC3
//
//  Created by Muna Aiman Al-hajj on 09/07/1445 AH.
//

import SwiftUI

struct Onboarding1: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.BB
                Image("onboarding1")
                    .offset(y:200)
                VStack{
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden()){
                        Text("Skip")
                    }
                    .offset(x:154,y:-320)
                    
                    Text("Unlcok the beatuy of the local life")
                        .font(
                            Font.custom("Source Sans Pro", size: 34)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .frame(width: 310, alignment: .top)
                        .offset(y:-130)
                }
                
                NavigationLink(destination:Onboarding2().navigationBarBackButtonHidden()){
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
        .navigationBarBackButtonHidden(true)
        
        
    }
}

#Preview {
    Onboarding1()
}
