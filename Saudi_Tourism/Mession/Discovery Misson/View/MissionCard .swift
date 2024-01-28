//
//  MissionCard .swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 12/07/1445 AH.
//

import SwiftUI

    struct MissionCard: View {
        let mission: Mission
            var isStarted: Bool
            var showPopup: (HintPopupModel) -> Void
        
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
                    let popupModel = HintPopupModel(
                        id: mission.id,
                        title: mission.title,
                        image: mission.imageName,
                        description: mission.description, // Use the unique description from the Mission instance
                        actionButtonTitle: mission.id < 3 ? "Level Up" : "Complete"
                    )
                    showPopup(popupModel)
                }) {
                    Text("Start")
                        .frame(width: 100, height: 30)
                        .bold()
                        .foregroundColor(.white)
                        .background(Color(red: 0.88, green: 0.29, blue: 0.12))
                        .cornerRadius(5)
                        .padding([.bottom, .trailing])
                }
                .buttonStyle(PlainButtonStyle())
                .disabled(isStarted) 
                .offset(x: 230)
            }
            .frame(width: 350, height: 200)
            .clipped()
        }
    }


struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MissionView(missions: [
                Mission(id: 1, imageName: "mission1", title: "traditional medicine", description: "Description for Mission 1"),
                Mission(id: 2, imageName: "mission2", title: "Mud House Mission", description: "Description for Mission 2"),
                Mission(id: 3, imageName: "mission3", title: "Saudi Coffee Traditions", description: "Description for Mission 3")
            ])

            // Add a preview for the CongratsPopupView
            CongratsPopupView(isShowing: .constant(true))
        }
    }
}

