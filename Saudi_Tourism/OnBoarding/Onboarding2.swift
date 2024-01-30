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
                .offset(y:30)
                .shadow(color: Color(red: 0.16, green: 0.09, blue: 0.06).opacity(0.25), radius: 19, x: 0, y: 0)
            
            NavigationLink(destination: MissionMapView(viewModel: MissionMapViewModel()) .navigationBarBackButtonHidden()){
                Text("Skip")
            }
            .offset(x:154,y:-353)
            .foregroundColor(.black)

            
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
                    Font.custom("Inter", size: 22)
                      .weight(.medium)
                  )
                  .kerning(1.98)
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.91, green: 0.9, blue: 0.84))
                  .frame(width: 300 , height: 60)
                  .background(Color(red: 0.88, green: 0.29, blue: 0.12))
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
    Onboarding2()
}
