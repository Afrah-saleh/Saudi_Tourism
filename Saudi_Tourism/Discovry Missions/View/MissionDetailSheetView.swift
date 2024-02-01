


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
                    Text("\(mission.number)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .background(Color.brown)

                    Text(mission.title)
                        .font(.title2)
                        .bold()

                    Spacer()

                }
                .padding()

                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)

                Spacer()

                Text(mission.description)
                    .font(Font.custom("Source Sans Pro", size: 17))
                    .foregroundColor(Color(red: 0.18, green: 0.23, blue: 0.31))
                    .font(.body)
                    .padding([.leading, .trailing, .bottom])

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
                        .background(Color.red)
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

