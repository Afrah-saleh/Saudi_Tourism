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
                    Text("Get Started")
                      .font(
                        Font.custom("Inter", size: 22)
                          .weight(.medium)
                      )
                      .kerning(1.98)
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.91, green: 0.9, blue: 0.84))
                      .frame(width: 300 , height: 60)
                      .background(Color(red: 0.95, green: 0.7, blue: 0.05))
                      .cornerRadius(13)
                      .shadow(color: Color(red: 0.16, green: 0.09, blue: 0.06).opacity(0.25), radius: 19, x: 0, y: 0)
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
