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
    let isActiveLevel: Bool // Add a new property to determine if it's the active level

    var body: some View {
        ZStack {
            if level == 5 {
                Image("Gift")
                    .resizable()
                    .frame(width: 100, height: 150)
            } else {
                Image("levels")
                    .resizable()
                    .frame(width: 130, height: 130)
                
                if isUnlocked {
                    Text("\(level)")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom, 10)
                }
            }
        }
        .frame(width: 150, height: 150, alignment: .center)
        .opacity(isUnlocked ? 1 : 0.5)
        .shadow(color: isActiveLevel ? Color("BTCOLOR") : .clear, radius: 1) // Add a shadow with red color for the active level
    }
}


#Preview {
    LevelIconView(level: Int(), isUnlocked: Bool(), isActiveLevel: Bool())
}
