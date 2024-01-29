


import SwiftUI

struct MissionDetailSheetView: View {
    @ObservedObject var viewModel : MissionMapViewModel
    @ObservedObject var vm: MissionViewModel
    let mission: MissionModel
    @Binding var isShowing: Bool
    var advanceLevel: () -> Void // Add this property

    
    
    var body: some View {
        ZStack{
            Color.BB
                .ignoresSafeArea()
            VStack{
                HStack{
                    
                    Text("\(mission.number)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .background(Color.brown)
                    
                    
                    Text(mission.title)
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            self.isShowing = false
                
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
                Spacer()
                
                
                Text(mission.description)
                            .foregroundColor(.gray)
                            .font(.body)
                    .padding([.leading, .trailing, .bottom])
                    
                    Spacer()
                
                Button(action: {
                    // Handle the button action here
                    self.isShowing = false
                    // Complete the mission and possibly unlock the next level
                          vm.completeMission(missionId: mission.id)
                          advanceLevel() // Call advanceLevel on tap of the action button
                          self.isShowing = false
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
                self.isShowing = false
            }
        }
        
    }
}
        
