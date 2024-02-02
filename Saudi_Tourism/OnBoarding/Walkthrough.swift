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
                ScreenView(baseImageName: "On Bording1", btntitlte: "Next")
                    .transition(.scale)
            }
            
            if currentPage == 2 {
                ScreenView(baseImageName: "On Bording2",btntitlte: "Next")
         
                    .transition(.scale)
            }
            
            if currentPage == 3 {
                ScreenView(baseImageName: "On Bording3", btntitlte: "Get Started")
            
                    .transition(.scale)
            }
        }

    }
}
#Preview {
    Walkthrough()
}
struct ScreenView: View {
  //  var image: String
    var baseImageName: String
   // var title: String
    //var detail: String
    var btntitlte: String
     @AppStorage("currentPage") var currentPage = 1
    @Environment(\.layoutDirection) var layoutDirection

    var body: some View {
        ZStack{
            Image(baseImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        
            VStack(spacing: 20){
                HStack{
                    if currentPage == 1{
                        Text("")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .kerning(1.4)
                            .foregroundColor(Color.black)
                            .padding(.all)
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
                        }).padding(.top,40)
                    }
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage = 4
                        }
                    }, label: {
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("BTCOLOR"))
                            .padding(.top,40)
                          //  .padding(.leading,300)
                    })
                }
                .foregroundColor(.black)
                .padding()
               // Spacer(minLength: 100)
                Spacer()
                
                //Text(title)
//                Text(NSLocalizedString(title, comment: ""))
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
                   // .padding(.top)
                    .padding(.bottom,300)
                  // .multilineTextAlignment(.center)
               Spacer(minLength: 5)
                
                
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
