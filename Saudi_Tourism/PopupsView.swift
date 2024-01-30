//
//  PopupsView.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 18/07/1445 AH.
//

import SwiftUI

struct PopupsView: View {
    let content: PopupContent
    var onCollect: () -> Void
    
    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)

            // Popup content
            VStack(spacing: 20) {
                Text(content.title)
                    .font(.headline)

                Image(systemName: content.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)

                Text(content.description)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)

                Button(action: onCollect) {
                    Text("Collect")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(15)
            .padding(40)  // Control the size of the popup here
            .shadow(radius: 20)
        }
    }
}
