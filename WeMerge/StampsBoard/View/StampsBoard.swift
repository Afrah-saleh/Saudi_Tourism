//
//  StampsBoard.swift
//  Saudi_Tourism
//
//  Created by Sahora on 23/01/2024.
//

//import Foundation
//import SwiftUI
//
//
//
//struct StampsBoard: View {
//    @ObservedObject var viewModel: MissionMapViewModel
//    @State private var navigateToMissionMap = false // State to control navigation
//    @State private var showMap = false
//   
//    
//    var body: some View {
//        NavigationStack{
//            ZStack {
//                Color.BB
//                    .ignoresSafeArea()
//                Rectangle()
//                .frame(width: 369, height: 712)
//                .foregroundColor(Color(red: 0.98, green: 0.96, blue: 0.9))
//                .cornerRadius(13)
//                .padding( .top, 93)
//                .padding( .bottom, 39)
//                .padding( .leading, 21)
//                
//                    Rectangle()
//                        .foregroundColor(Color(red: 0.16, green: 0.09, blue: 0.06))
//                        .frame(width: 36.10798, height: 85.9714)
//                        .padding( .top, 93)
//                        .padding( .bottom, 665)
//                        .padding( .leading, 57)
//                        .padding( .trailing, 297)
//
//                    
//                    Image("Group")
//                        .frame(width: 21.6797, height: 26.7305)
//                        .padding( .top, 124)
//                        .padding( .bottom, 693)
//                        .padding( .leading, 64)
//                        .padding( .trailing, 304)
//                
//                
//                Image("Stamp1")
//                    .resizable(resizingMode: .stretch)
//                    .frame(width: 127, height: 137)
//                    .padding( .top, 110)
//                    .padding( .bottom, 465)
//                    .padding( .leading, 199)
//                    .padding( .trailing, 43)
//                ShareLink(item: "Stamp1", preview: SharePreview("Instafilter image", image: "Stamp1"))
//                    .padding( .top, 110)
//                    .padding( .bottom, 278)
//                    .padding( .leading, 199)
//                    .padding( .trailing, 43)
//                
//                
//                
//                Button("X") {
//                    showMap = true
//                    
//                }
//                .foregroundColor(.BTCOLOR)
//                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                .bold()
//                .offset(x:165,y:-370)
//            }
//
//            .navigationDestination(isPresented: $showMap) {
//                MissionMapView(viewModel: viewModel)
//            }
//            .navigationBarHidden(true)
//        }
//      
//      //  .navigationBarBackButtonHidden(true)
//               
//                
//            }
//            
//        }
 



