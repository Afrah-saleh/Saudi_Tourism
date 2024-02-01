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
                    NavigationLink(destination: MissionMapView(viewModel: MissionMapViewModel()) .navigationBarBackButtonHidden()){
                        Text("Skip")
                    }
                    .offset(x:154,y:-320)
                    .foregroundColor(.BTCOLOR)
                    
                    Text(" Saudi Arabia \n Live it Local, Live it as It Is")
                        .font(
                            Font.custom("Source Sans Pro", size: 27)
                            .weight(.semibold)
                            )
                        .multilineTextAlignment(.center)
                        .frame(width: 410, alignment: .top)
                        .offset(y:-130)
                }
                
                NavigationLink(destination:Onboarding2().navigationBarBackButtonHidden()){
                    Text("Get Started")
                      .font(
                        Font.custom("Inter", size: 22)
                          .weight(.medium)
                      )
                      .kerning(1.98)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.white)
                      .frame(width: 300 , height: 60)
                      .background(.BTCOLOR)
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
