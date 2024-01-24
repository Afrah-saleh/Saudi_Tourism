//
//  MissionCard .swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 12/07/1445 AH.
//

import SwiftUI

struct MissionCard: View {
    let mission: Mission
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(mission.imageName)
                .resizable()
                .cornerRadius(10)
            
            Text(mission.title)
                .font(.headline)
                .padding()
                .foregroundColor(.white)
            
            Button(action: {
                // Handle start action
            }) {
                Text("Start")
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 30)
                    .bold()
                    .foregroundColor(.white)
                    .background(Color(red: 0.88, green: 0.29, blue: 0.12))
                    .cornerRadius(5)
                    .padding([.bottom, .trailing])
            }
            .buttonStyle(PlainButtonStyle()) // Disable the default button styling
            .offset(x:230)
        }
        .frame(width: 350, height: 200)
        .clipped()
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MissionView(missions: [
                Mission(id: 1, imageName: "mission1", title: "Crying Kid Mission"),
                Mission(id: 2, imageName: "mission1", title: "Mud House Mission"),
                Mission(id: 3, imageName: "mission1", title: "Saudi Coffee Traditions")
            ])
        }
    }
}
