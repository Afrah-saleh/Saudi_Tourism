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
            Image("levels")
                .resizable()
                .frame(width: 150, height: 150)

            Text("\(level)")
                .font(.system(size: 24))
                .foregroundColor(.white)
                .bold()
                .padding(.bottom,10)
        }
        .frame(width: 150, height: 150, alignment: .center)
        .opacity(isUnlocked ? 1 : 0.5)
    }
}

#Preview {
    LevelIconView(level: Int(), isUnlocked: Bool())
}
