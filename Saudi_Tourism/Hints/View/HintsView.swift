//
//  HintsView.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 11/07/1445 AH.
//


import SwiftUI

struct HintsView: View {
    @ObservedObject var viewModel: HintsViewModel // View model for hints, observed for changes.
    @ObservedObject var vm: MissionMapViewModel  // View model for the mission map, observed for changes.


        var body: some View {
            NavigationView{
                ZStack{
                    Color.BB
                        .ignoresSafeArea()
                    VStack(alignment: .leading) {
                        ZStack{
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    // Iterate over the hints provided by the view model.
                                    ForEach(viewModel.hints) { place in
                            Image(place.image)
                                .frame(width: 400, height: 630)
                                .scrollTransition(topLeading: .interactive,
                                  bottomTrailing: .interactive,
                                  axis: .horizontal) { effect, phase in effect
                                        .scaleEffect(1 - abs(phase.value))
                                        .opacity(1 - abs(phase.value))
                                                }
                                          .onTapGesture {
                                              // Change the selected hint with an animation when an image is tapped.
                                              withAnimation {
                                                  viewModel.selectedHint = place
                                      }
                                    }
                                }
                            }
                                .scrollTargetLayout()
                            }
                            // Display the name of the selected hint, if one exists.
                            if let selectedHint = viewModel.selectedHint {
                                Text(selectedHint.name)
                                    .font(
                                    Font.custom("Source Sans Pro", size: 28)
                                    .weight(.semibold)
                                    )
                                    .frame(width: 350)
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
                            // Display the description of the selected hint, or an empty string if none is selected.
                            
                            Text(viewModel.selectedHint?.desc ?? "")
                                .font(.headline)
                                .frame(width: 200)
                                .multilineTextAlignment(.center)
                                .padding()
                                .offset(y:70)
                            
                            HStack {
                                // A button to go back to the previous hint.
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
                                
                                .disabled(viewModel.selectedHint == viewModel.hints.first) // Disable the button if the current hint is the first one.
                                
                                // Conditionally show a navigation link or a button depending on the selected hint.
                                                if viewModel.selectedHint == viewModel.hints.last {
                                                    // If it's the last hint, show a navigation link to the doorAnimation view.
                                                    NavigationLink(destination: doorAnimation(sheetShowing: .constant(true), viewModel: HintsViewModel(level: viewModel.level), vm: vm)){
                                                        
//                                                    NavigationLink(destination: LevelDetailView(viewModel: MissionMapViewModel(), location: LocationsDataService.locations.first { $0.activeLevel == viewModel.level } ?? LocationsDataService.locations.first!, levelNumber: viewModel.level)){
//                                                    
                                       Image("go")
                                                        
                            // If it's the last hint, show a navigation link to the doorAnimation view.
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
                
                // Set the title for the navigation bar and apply font settings.
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


