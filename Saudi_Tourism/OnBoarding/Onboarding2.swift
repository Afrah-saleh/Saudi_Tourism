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
                .ignoresSafeArea()
            ZStack{
                Image("hintOnboarding")
                    .offset(y:30)
                    .shadow(color: Color(red: 0.16, green: 0.09, blue: 0.06).opacity(0.25), radius: 19, x: 0, y: 0)
                
                Text("Merge\nin\nculture")
                  .font(
                    Font.custom("Source Sans Pro", size: 32)
                      .weight(.semibold)
                  )
                  .multilineTextAlignment(.center)
            }
            
            NavigationLink(destination: MissionMapView(viewModel: MissionMapViewModel()) .navigationBarBackButtonHidden()){
                Text("Skip")
            }
            .offset(x:154,y:-320)
            .foregroundColor(.BTCOLOR)

            
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
                  .foregroundColor(.white)
                  .frame(width: 300 , height: 60)
                  .background(.BTCOLOR)
                  .cornerRadius(13)
            }
            .offset(y:310)
        }//Zstack
    }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Onboarding2()
}
