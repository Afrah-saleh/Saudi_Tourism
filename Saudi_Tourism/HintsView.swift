//
//  HintsView.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 11/07/1445 AH.
//
import SwiftUI

struct HintsView: View {
        @State var Hint: Place?
        let Hints: [Place] = [
            Place(name: "Hint 1 \n The life before \n 297", image: "Hint", desc: "Years Ago"),
            Place(name: "Hint2", image: "Hint" ,desc: ""),
            Place(name: "Hint3 hint 3", image: "Hint", desc: ""),
        ]

        var body: some View {
            NavigationView{
                ZStack{
                    VStack(alignment: .leading) {
                        ZStack{
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(Hints) { place in
                                        Image(place.image)
                                            .resizable()
                                            .cornerRadius(15)
                                            .frame(width: 340, height: 600)
                                        //.shadow(radius: 10, y: 10)
                                            .scrollTransition(topLeading: .interactive,
                                                              bottomTrailing: .interactive,
                                                              axis: .horizontal) { effect, phase in
                                                effect
                                                    .scaleEffect(1 - abs(phase.value))
                                                    .opacity(1 - abs(phase.value))
                                            }
                                                              .onTapGesture {
                                                                  withAnimation {
                                                                      self.Hint = place
                                                                  }
                                                              }
                                    }
                                }
                                .scrollTargetLayout()
                            }
                            .frame(height: 200)
                            .safeAreaPadding(.horizontal, 32)
                            .scrollClipDisabled()
                            .scrollTargetBehavior(.viewAligned)
                            .scrollPosition(id: $Hint)
                            .onAppear {
                                Hint = Hints[0]
                            }
                            
                            
                            Text(Hint?.name ?? "")
                                .font(.title)
                            // .foregroundColor(.white)
                                .frame(width: 200)
                                .multilineTextAlignment(.center)
                                .offset(y:-20)
                                .bold()
                            
                            Spacer()
                            
                            Text(Hint?.desc ?? "")
                                .font(.headline)
                                .frame(width: 200)
                                .multilineTextAlignment(.center)
                                .padding()
                                .offset(y:70)
                            
                            HStack {
                                Button {
                                    withAnimation {
                                        guard let Hint, let index = Hints.firstIndex(of: Hint),
                                              index > 0 else { return }
                                        self.Hint = Hints[index - 1]
                                    }
                                } label: {
                                    ZStack{
                                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                            .frame(width: 161,height: 70)
                                            .foregroundColor(Color(red: 0.98, green: 0.96, blue: 0.9))
                                        
                                        Text("Back")
                                            .font(.system(size: 32))
                                            .foregroundColor(.black)
                                    }
                                }
                                //.disabled(Hint == Hints.first)
                                
                                
                                if Hint == Hints.last {
                                    NavigationLink(destination: ContentView()){
                                        Image("go")
                                        
                                    } } else{
                                        
                                        Button {
                                            withAnimation {
                                                guard let Hint, let index = Hints.firstIndex(of: Hint),
                                                      index < Hints.count - 1 else { return }
                                                self.Hint = Hints[index + 1]
                                                
                                            }
                                        } label: {
                                            Image("Next")
                                                .font(.system(size: 32))
                                        }
                                        //.disabled(Hint == Hints.last)
                                    }
                            }
                            .padding(32)
                            .offset(y:260)
                        }
                        
                    }
                }
                .navigationTitle("Hints")
                .font(
                Font.custom("Source Sans Pro", size: 28)
                .weight(.semibold)
                )
            }
            
        }
    }


#Preview {
    HintsView()
}

struct Place: Hashable, Identifiable {
    var id: Self { self }

    let name: String
    let image: String
    let desc: String
}


