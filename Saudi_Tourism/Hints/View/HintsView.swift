//
//  HintsView.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 11/07/1445 AH.
//
import SwiftUI

struct HintsView: View {
    @ObservedObject var viewModel: HintsViewModel
    @ObservedObject var vm: MissionMapViewModel


        var body: some View {
            NavigationView{
                ZStack{
                    Color.BB
                        .ignoresSafeArea()
                    VStack(alignment: .leading) {
                        ZStack{
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(viewModel.hints) { place in
                            Image(place.image)
                               // .cornerRadius(30)
                                .frame(width: 400, height: 630)
                                .scrollTransition(topLeading: .interactive,
                                  bottomTrailing: .interactive,
                                  axis: .horizontal) { effect, phase in effect
                                        .scaleEffect(1 - abs(phase.value))
                                        .opacity(1 - abs(phase.value))
                                                }
                                          .onTapGesture {
                                              withAnimation {
                                                  viewModel.selectedHint = place
                                      }
                                    }
                                }
                            }
                                .scrollTargetLayout()
                            }
                            if let selectedHint = viewModel.selectedHint {
                                Text(selectedHint.name)
                                    .font(.title)
                                    .frame(width: 200)
                                    .multilineTextAlignment(.center)
                                    .offset(y: -20)
                                    .bold()
                                Spacer()
                                    .frame(height: 200)
                                    .safeAreaPadding(.horizontal, 32)
                                    .scrollClipDisabled()
                                    .scrollTargetBehavior(.viewAligned)
                            }
                            Spacer()
                            
                            Text(viewModel.selectedHint?.desc ?? "")
                                .font(.headline)
                                .frame(width: 200)
                                .multilineTextAlignment(.center)
                                .padding()
                                .offset(y:70)
                            
                            HStack {
                                Button {
                                    withAnimation {
                                        viewModel.selectPreviousHint()
                                    }
                                } label: {
                                    ZStack{
                                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                            .frame(width: 150,height: 50)
                                            .foregroundColor(Color(red: 0.98, green: 0.96, blue: 0.9))
                                        
                                        Text("Back")
                                            .font(.system(size: 32))
                                            .foregroundColor(.black)
                                    }
                                }
                                
                                .disabled(viewModel.selectedHint == viewModel.hints.first)
                                                if viewModel.selectedHint == viewModel.hints.last {
                                                    NavigationLink(destination: doorAnimation(sheetShowing: .constant(true), viewModel: HintsViewModel(level: viewModel.level), vm: vm)){
                                                        
//                                                    NavigationLink(destination: LevelDetailView(viewModel: MissionMapViewModel(), location: LocationsDataService.locations.first { $0.activeLevel == viewModel.level } ?? LocationsDataService.locations.first!, levelNumber: viewModel.level)){
//                                                    
                                       Image("go")
                                        
                                    } } else{
                                        
                                        Button {
                                            withAnimation {
                                                viewModel.selectNextHint()
                                            }
                                        } label: {
                                            Image("Next")
                                                .font(.system(size: 32))
                                        }
                                    }
                            }
                            .padding(22)
                            .offset(x:10,y:283)
                        }
                        
                    }
                }
               
                .navigationTitle("Hints")
                .font(
                Font.custom("Source Sans Pro", size: 28)
                .weight(.semibold)
                
                )
            }
            .navigationBarBackButtonHidden(true)
            
        }
    }


struct HintsView_Previews: PreviewProvider {
    static var previews: some View {
        HintsView(viewModel: HintsViewModel(level: 1), vm: MissionMapViewModel())
    }
}


