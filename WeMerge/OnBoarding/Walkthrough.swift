//
//  Walkthrough.swift
//  TinyTalks
//
//  Created by Afrah Saleh on 13/06/1445 AH.
//

import SwiftUI

struct Walkthrough: View {
    @AppStorage("currentPage") var currentPage = 1

    var body: some View {
        ZStack{
            if currentPage == 1 {
                ScreenView(baseImageName: "onboarding1", title: " Saudi Arabia \n Live it Local, Live it as It Is", detail: "", btntitlte: "Next")
                    .transition(.scale)
                
            }
            
            if currentPage == 2 {
                ScreenView(baseImageName: "onboarding2", title: "Merge \n in \n culture ", detail: "",btntitlte: "Next")
         
                    .transition(.scale)
            }
            
            if currentPage == 3 {
                ScreenView(baseImageName: "Onboarding3", title: "Collect your stamps \n To keep the memory in the mind!", detail: "", btntitlte: "Get Started")
            
                    .transition(.scale)
            }
        }

    }
}
#Preview {
    Walkthrough()
}
struct ScreenView: View {
    var baseImageName: String
    var title: String
    var detail: String
    var btntitlte: String
    @AppStorage("currentPage") var currentPage = 1
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        ZStack{
            Color.BB
                .ignoresSafeArea()
            if currentPage == 1 {
                GeometryReader { geometry in
                    Image(baseImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .padding(.top,200)
                        .alignmentGuide(.bottom) { d in
                            d[VerticalAlignment.bottom]
                        }
                }
            } else if currentPage == 2{
                GeometryReader { geometry in
                    Image(baseImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        //.padding(.top,200)
                        .alignmentGuide(.bottom) { d in
                            d[VerticalAlignment.bottom]
                        }
                }
            }
            else{
                GeometryReader { geometry in
                    Image(baseImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.6) // Adjust the scale as needed
                        .clipped()
                        .padding(.top,50)
                        .padding(.leading,80)
                        .alignmentGuide(.bottom) { d in
                            d[VerticalAlignment.bottom]
                        }
                }
            }
                VStack(spacing: 20){
                    HStack{
                        if currentPage == 1{
                            Text("")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(.bold)
                                .kerning(1.4)
                                .foregroundColor(Color.black)
                                .padding(.all)
                                .multilineTextAlignment(.center)
                        }
                        else{
                            Button(action: {
                                withAnimation(.easeInOut){
                                    currentPage -= 1
                                }
                            }, label: {
                                Image(systemName: layoutDirection == .rightToLeft ? "chevron.right" : "chevron.left")
                                    .foregroundColor(Color("BTCOLOR"))
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                //.background(Color("BTCOLOR").opacity(0.4))
                                    .cornerRadius(10)
                            }).padding(.top,-10)
                        }
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.easeInOut){
                                currentPage = 4
                            }
                        }, label: {
                            if currentPage == 1{
                                Text("Skip")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("BTCOLOR"))
                                    .padding(.top,-10)
                            }
                            else           if currentPage == 2{
                                Text("Skip")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("BTCOLOR"))
                                    .padding(.top,-10)
                            }
                           else if currentPage == 3{
                                Text("")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("BTCOLOR"))
                                    .padding(.top,40)
                            } 
                        })
                    }
                    .foregroundColor(.black)
                    .padding()
                    Spacer()
                    
                    if currentPage == 1{
                        Text(NSLocalizedString(title, comment: ""))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top)
                            .padding(.bottom,300)
                            .multilineTextAlignment(.center)
                        Spacer(minLength: 5)
                    }
                    else if currentPage == 2{
                        Text(NSLocalizedString(title, comment: ""))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top)
                            .padding(.bottom,200)
                            .multilineTextAlignment(.center)
                        Spacer(minLength: 5)
                    }
                    else {
                        Text(NSLocalizedString(title, comment: ""))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top,180)
                            .multilineTextAlignment(.center)
                        Spacer(minLength: 5)
                    }

                    
                }
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut){
                        //checking
                        if currentPage < totalPages{
                            currentPage += 1
                        }
                        else{
                            //for app test
                            currentPage = 4
                            
                        }
                    }
                }, label: {
                    Text(btntitlte)
                        .fontWeight(.semibold)
                        .font(.title2)
                        .kerning(1.98)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(width: 300 , height: 60)
                        .background(Color("BTCOLOR"))
                        .cornerRadius(13)
                }).padding(.top,600)
                    .transition(.scale)
                
            }
        }
        
    }

//total pages
var totalPages = 3
