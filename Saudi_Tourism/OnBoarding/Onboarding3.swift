//
//  Onboarding3.swift
//  MC3
//
//  Created by Muna Aiman Al-hajj on 09/07/1445 AH.
//

import SwiftUI

struct Onboarding3: View {
    var body: some View {
            ZStack{
                Color.BB
                Image("Onboarding3")
                    .offset(y:-60)
                
                Text("Collect your stamps \n to keep the memory in the mind!")
                    .font(.title)
                    .fontWeight(.bold)
                  .foregroundColor(.dark)
                  .multilineTextAlignment(.center)
                    .frame(width: 353, alignment: .top)
                    .offset(y:180)
                
                NavigationLink(destination:MissionMapView(viewModel: MissionMapViewModel()).navigationBarBackButtonHidden()){
                    Text("Get Started")
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
            .edgesIgnoringSafeArea(.all)
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Onboarding3()
}
