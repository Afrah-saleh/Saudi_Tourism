//
//  StampsBoard.swift
//  Saudi_Tourism
//
//  Created by Sahora on 23/01/2024.
//

import Foundation
import SwiftUI



struct StampsBoard: View {
   
    
    var body: some View {
   


        ZStack {
               
            
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 369, height: 712)
              .background(Color(red: 0.98, green: 0.98, blue: 0.98))
              .cornerRadius(13)
              .padding( .top, 93)
              .padding( .bottom, 39)
              .padding( .leading, 21)


            
            ZStack {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 36.10798, height: 85.9714)
                  .background(Color(red: 0.16, green: 0.09, blue: 0.06))
                  .padding( .top, 93)
                  .padding( .bottom, 665)
                  .padding( .leading, 57)
                  .padding( .trailing, 297)
                
                  
                
                Image("Group")
                .frame(width: 21.6797, height: 26.7305)
                .padding( .top, 124)
                .padding( .bottom, 693)
                .padding( .leading, 64)
                .padding( .trailing, 304)
            }
            
            
          
            Image("Stamp1")
                .resizable(resizingMode: .stretch)
                .frame(width: 127, height: 137)
                .padding( .top, 110)
                .padding( .bottom, 465)
                .padding( .leading, 199)
                .padding( .trailing, 43)
            ShareLink(item: "Stamp1", preview: SharePreview("Instafilter image", image: "Stamp1"))
                .padding( .top, 110)
                .padding( .bottom, 278)
                .padding( .leading, 199)
                .padding( .trailing, 43)
            


            
            HStack {
                Text ("Stamps")
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color(red: 0.159, green: 0.091, blue: 0.057))
                        .frame(width: 30.0, height: 24.0)

                }
                .navigationTitle("First View")
            }
            .padding(.top , 44)
            .padding( .bottom, 772)
            .padding( .leading, 27)
            .padding( .trailing, 340)
            
            
            
                


            
        }
        .frame(width: 390, height: 844)
        .background(Color(red: 0.92, green: 0.9, blue: 0.84))
    }
    
}

#Preview {
    StampsBoard()
}
