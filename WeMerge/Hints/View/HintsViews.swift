//
//  HintsViews.swift
//  WeMerge
//
//  Created by Afrah Saleh on 24/07/1445 AH.
//

import SwiftUI

struct HintsViews: View {
    @ObservedObject var viewModel: HintsViewModel
    @ObservedObject var vm: MissionMapViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.BB
                    .ignoresSafeArea()
                ZStack (alignment: .center){
                    
                    ForEach(viewModel.hints) { place in
                        Image(place.image)
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                            .frame(alignment: .center)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.selectedHint = place
                                }
                            }
                    }
                    
                    VStack {
                        if let selectedHint = viewModel.selectedHint {
                            Text(selectedHint.name)
                                .frame(width: 350)
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .bold()
                        }
                        
                        Text(viewModel.selectedHint?.desc ?? "")
                            .font(.headline)
                            .frame(width: 200)
                            .multilineTextAlignment(.center)
                        
                    }
                    HStack {
                        Button(action: {
                            withAnimation {
                                viewModel.selectPreviousHint()
                            }
                        }) {
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                    .frame(width: 150, height: 50)
                                    .foregroundColor(Color(red: 0.98, green: 0.96, blue: 0.9))
                                
                                Text("Back")
                                    .font(.system(size: 24))
                                    .foregroundColor(.black)
                            }
                        }
                        .disabled(viewModel.selectedHint == viewModel.hints.first)
                        
                        
                        if viewModel.selectedHint == viewModel.hints.last {
                            NavigationLink(destination: doorAnimation(sheetShowing: .constant(true), viewModel: HintsViewModel(level: viewModel.level), vm: vm)) {
                                Image("Next")
                                    .frame(width: 150, height: 50)
                                    .padding(.leading)
                                
                            }
                        } else {
                            Button(action: {
                                withAnimation {
                                    viewModel.selectNextHint()
                                }
                            }) {
                                Image("Next")
                                    .font(.system(size: 32))
                                    .frame(width: 150, height: 50)
                                    .padding(.leading)
                                
                            }
                        }
                    }.padding(.top,610)
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("About")
        }
        .navigationBarBackButtonHidden(true)
   
    }
  
        

}
#Preview {
    HintsViews(viewModel: HintsViewModel(level: 1), vm: MissionMapViewModel())
}
