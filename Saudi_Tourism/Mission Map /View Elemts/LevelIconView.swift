//
//  LevelIconView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import SwiftUI

struct LevelIconView: View {
    // Declare a constant `level` to store the level number
    let level: Int
    
    // Declare a constant `isUnlocked` to indicate if the level is accessible
    let isUnlocked: Bool

    var body: some View {
        
        
        ZStack {
            // Check if the level is 5 and change the image and text accordingly
            // if for showing the level 5 in mapView
            if level == 5 {
                // If level is 5, use a special image, presumably a gift
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
                // For other levels, use a default appearance
                Image("levels")
                    .resizable()
                    .frame(width: 130, height: 130)

                Text("\(level)")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 10)
            }
            
            
            
        }//zstack
        .frame(width: 150, height: 150, alignment: .center)
        .opacity(isUnlocked ? 1 : 0) // Change opacity based on whether the level is unlocked or not
    }
}

#Preview {
    LevelIconView(level: Int(), isUnlocked: Bool())
}
