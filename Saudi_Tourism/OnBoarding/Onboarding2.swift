//
//  Onboarding2.swift
//  MC3
//
//  Created by Muna Aiman Al-hajj on 09/07/1445 AH.
//

import SwiftUI

struct Onboarding2: View {
    var body: some View {
        ZStack{
            Color.BB
                .ignoresSafeArea()
            ZStack{
                Image("hintOnboarding")
                    .offset(y:30)
                    .shadow(color: Color(red: 0.16, green: 0.09, blue: 0.06).opacity(0.25), radius: 19, x: 0, y: 0)
                
                Text("Immerse\n in\n culture")

                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                  .foregroundColor(.dark)
                  .multilineTextAlignment(.center)
            }
            
            NavigationLink(destination: MissionMapView(viewModel: MissionMapViewModel()) .navigationBarBackButtonHidden()){
                Text("Skip")
                    .fontWeight(.semibold)
                    .font(.headline)
            }
            .offset(x:154,y:-350)
            .foregroundColor(.BTCOLOR)


            
            NavigationLink(destination:Onboarding3().navigationBarBackButtonHidden()){
                Text("Next")
                    .fontWeight(.semibold)
                    .font(.title2)
                  .kerning(1.98)
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 300 , height: 60)
                  .background(.BTCOLOR)
                  .cornerRadius(13)
            }
            .offset(y:310)
        }//Zstack
    
        //.navigationBarBackButtonHidden(true)

    }
}

#Preview {
    Onboarding2()
}
