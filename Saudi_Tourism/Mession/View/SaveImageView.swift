//
//  SaveImageView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 10/07/1445 AH.
//

import SwiftUI

struct SaveImageView: View {
    
    let image = UIImage(named: "levels")!
    
    var body: some View {
        VStack {
            Text("Sticky Toffee Cake")
            
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 220, alignment: .center)
                .clipped()

            Spacer().frame(height:100)
            
            Button {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            } label: {
                HStack {
                    Image(systemName: "photo.on.rectangle.angled")
                    Text("Add to Photos")
                }
                .font(.title)
                .foregroundColor(.purple)
            }
            Spacer()
        }
    }
}


#Preview {
    SaveImageView()
}
