//
//  InfoSheetView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 18/07/1445 AH.
//

import SwiftUI

struct InfoSheetView: View {
    @Binding var selectedLevel: Level?
    @Binding var showHintsView: Bool
    var viewModel: MissionMapViewModel
    var level: Level
    var levelTitle: String
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.BB
                    .ignoresSafeArea()
                VStack{
                    
                    Text(levelTitle) // Display the level title
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,50)
                        .padding(.top,40)
                        .padding(.trailing,60)
                    Button(action: {
                        showHintsView = true
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 340, height: 57)
                                .cornerRadius(13)
                                .tint(Color("BTCOLOR"))
                            
                            Text("Start")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                       
                    }
                    .fullScreenCover(isPresented: $showHintsView) {
                        HintsView(viewModel: HintsViewModel(level: level.id), vm: viewModel)
                    }
                    .padding()
                }
            }
        }
    }
    
}
