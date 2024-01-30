//
//  LevelUpSheetView.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 18/07/1445 AH.
//
import SwiftUI
    
    struct LevelUpSheetView: View {
        let content: SheetContent
        let buttonTitle: String  // Add a button title parameter
        var onDismiss: () -> Void
        
        var body: some View {
            VStack {
                Text(content.title)
                    .font(.largeTitle)
                    .padding()
                
                Image(content.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(content.description)
                    .padding()
                
                Button(buttonTitle) {
                    onDismiss()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                
                Spacer()
            }
        }
    }
