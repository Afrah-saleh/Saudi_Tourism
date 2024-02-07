//
//  stampsMap.swift
//  WeMerge
//
//  Created by Afrah Saleh on 25/07/1445 AH.
//

import SwiftUI

struct stampsMap: View {
    @Binding var showPopup: Bool
    @ObservedObject var viewModel: MissionMapViewModel
    @State private var navigateToMissionMap = false
    @State private var showMap = false
    var popupModel: CongratsModel
    var levelNumber: Int
    
    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    showPopup = false
                }
            
            // Popup content
   
                    
                    
                    
                    Spacer()
                    
                    Button(action: {
                        showPopup = false
                        //  self.action2()
                    }) {
                        Image(systemName: "xmark")
                    }
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    .offset(x:145,y:-650)
                }
                .frame(width: 350, height: 700)
                .background(Color(red: 0.98, green: 0.96, blue: 0.9))
                .cornerRadius(20)
                .shadow(radius: 20)
                .foregroundColor(.dark)
            }
        }
    
