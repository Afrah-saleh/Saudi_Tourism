


import SwiftUI

struct MissionDetailSheetView: View {
    @ObservedObject var viewModel: MissionMapViewModel
    @ObservedObject var vm: MissionViewModel
    let mission: MissionModel
    @Binding var isShowing: Bool
    var advanceLevel: () -> Void // Add this property
    @Environment(\.presentationMode) var presentationMode
    var showCongratsPopup: () -> Void

    var body: some View {
        ZStack {
            Color.BB
                .ignoresSafeArea()
            VStack {
                HStack {
                    ZStack{
                        Image("MissNum")
                        Text("\(mission.number)")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                    Text(mission.title)
                        .font(.title2)
                        .bold()

                        .padding()
                }
                

                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)

                    .padding([.leading, .trailing])

                Text(mission.description)
                    .foregroundColor(.black)
                    .font(.body)
                    .padding([.leading, .trailing, .top])

                Spacer()

                Button(action: {
                            // Complete the mission
                            vm.completeMission(missionId: mission.id)
                            // Check if it's the last mission
                            if vm.isLastMission(mission) {
                                showCongratsPopup() // Show congrats popup if it's the last mission
                            } else {
                                advanceLevel() // Otherwise, just advance the level
                            }
                            // Dismiss the sheet
                            self.isShowing = false
                            self.presentationMode.wrappedValue.dismiss()

                        }) {
                    Text(mission.actionButtonTitle.uppercased())
                        .bold()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color("BTCOLOR"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .onTapGesture {
            withAnimation {
                // Close the sheet when tapping outside the sheet content
                self.isShowing = false
            }
        }
    }
}

