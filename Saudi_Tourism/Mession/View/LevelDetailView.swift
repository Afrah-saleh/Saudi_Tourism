//
//  LevelDetailView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import SwiftUI

struct LevelDetailView: View {
    @ObservedObject var viewModel: MissionMapViewModel
    // The current level number.
    var levelNumber: Int
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Level \(levelNumber) Details")
                .font(.largeTitle)

            Button("Unlock Next Level") {
                viewModel.unlockLevel(levelNumber + 1)
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
        .navigationBarTitle("Level \(levelNumber)", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    LevelDetailView(viewModel: MissionMapViewModel(), levelNumber: Int())
}
