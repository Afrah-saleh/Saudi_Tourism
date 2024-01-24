//
//  MissionView.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 12/07/1445 AH.
//

import SwiftUI

struct Mission: Identifiable {
    let id: Int
    let imageName: String
    let title: String
}

struct MissionView: View {
    let missions: [Mission]
    
    var body: some View {
        ZStack{
            Color.BB
                .ignoresSafeArea()
            VStack(spacing: 20) {
                ForEach(missions) { mission in
                    MissionCard(mission: mission)
                }
            }
        }
            //.padding(.top)
        
        .navigationBarTitle("Discovery Missions", displayMode: .large)
        
    }
}

