//
//  LevelIconView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import SwiftUI

struct LevelIconView: View {
    let level: Int
    let isUnlocked: Bool

    var body: some View {
        ZStack {
            // Check if the level is 5 and change the image and text accordingly
            if level == 5 {
                // Square image for level 5
                Image("Gift") // Replace "square_image" with the actual image asset name for level 5
                    .resizable()
                    .frame(width: 130, height: 130)
                
                // Text "?" for level 5
                Text("?")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 10)
            } else {
                // Default appearance for levels other than 5
                Image("levels")
                    .resizable()
                    .frame(width: 130, height: 130)

                Text("\(level)")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 10)
            }
        }
        .frame(width: 150, height: 150, alignment: .center)
        .opacity(isUnlocked ? 1 : 1) // Change opacity based on whether the level is unlocked or not
    }
}

#Preview {
    LevelIconView(level: Int(), isUnlocked: Bool())
}
