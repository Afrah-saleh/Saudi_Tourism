//
//  Onboarding3.swift
//  MC3
//
//  Created by Muna Aiman Al-hajj on 09/07/1445 AH.
//

import SwiftUI

struct Onboarding3: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.BB
                Image("Onboarding33")
                    .offset(x:-50)
                Image("Onboarding3")
                    .offset(x:40,y:-100)
                
                Text("And collect your Memory Stamps!")
                    .font(
                        Font.custom("Source Sans Pro", size: 28)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .frame(width: 353, alignment: .top)
                    .offset(y:180)
                
                NavigationLink(destination:MissionMapView().navigationBarBackButtonHidden()){
                    Text("Get Started!")
                
                .font(
                    Font.custom("Inter", size: 24)
                        .weight(.medium)
                )
                .kerning(2.16)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.91, green: 0.9, blue: 0.84))
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
    Onboarding3()
}
