import SwiftUI

struct MissionDetailSheetView: View {
    let mission: MissionModel
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            Text("\(mission.number)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            // .padding(6)
                .background(Color.brown)
            // .cornerRadius(25)
            HStack {
                Text(mission.title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    self.isShowing = false
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
            
            VStack(alignment: .leading, spacing: 8) {
                Text(mission.description)
                    .foregroundColor(.gray)
                    .font(.body)
            }
            .padding([.leading, .trailing, .bottom])
            
            Spacer()
            
            Button(action: {
                // Perform an action when the button is tapped
            }) {
                Text(mission.actionButtonTitle)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .cornerRadius(25)
        .shadow(radius: 5)
        .padding()
        .onTapGesture {
            withAnimation {
                self.isShowing = false
            }
        }
    }
}
