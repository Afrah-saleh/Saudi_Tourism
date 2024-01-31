//
//  StampsBoard.swift
//  Saudi_Tourism
//
//  Created by Sahora on 23/01/2024.
//


/*
 import Foundation
 import SwiftUI
 import SwiftData
 
 
 
 struct StampsBoard: View {
 
 @Environment(\.modelContext) private var modelContext
 @Query private var Stamps: [Stamps]
 @State private var imageData: Data?
 
 //Function to convert img to tupe data
 func pngImageToData(image: String) -> Data? {
 //Take the name of the image
 if let image = UIImage(named: image), let data = image.pngData() {
 imageData = data
 print("PNG image converted to data: \(imageData!)")
 //Add the data img to Swift Data
 let newItem = Saudi_Tourism.Stamps(id: 1, lvl: "1", img :  imageData)
 modelContext.insert(newItem)
 //Retuen value could be used for displau
 return imageData
 } else {
 print("Failed to convert PNG image to data.")
 }
 return nil
 }
 
 
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
 
 
 
 
 
 
 
 
 
 
 
 
 }
 .onAppear{
 //Call the funcation to pass images
 let image2 = pngImageToData(image: "Stamp1.png")
 //Convert Data type to image type
 let image = UIImage(data: image2!)
 Image(uiImage: image!)
 }
 .frame(width: 390, height: 844)
 .background(Color(red: 0.92, green: 0.9, blue: 0.84))
 }
 
 }
 
 #Preview {
 StampsBoard()
 }
 
 */



import Foundation
import SwiftUI



struct StampsBoard: View {
    @ObservedObject var viewModel: MissionMapViewModel
    @State private var navigateToMissionMap = false // State to control navigation
    @State private var showMap = false
   
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.BB
                    .ignoresSafeArea()
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 369, height: 712)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                    .cornerRadius(13)
                    .padding( .top, 93)
                    .padding( .bottom, 39)
                    .padding( .leading, 21)
                
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
                
                
                
                Button("Unlock Next Level") {
                    
                    viewModel.unlockNextLevel()
                    
                    // Show map view
                    showMap = true
                    
                }
                
            }
            .fullScreenCover(isPresented: $showMap) {
                MissionMapView(viewModel: viewModel)
            }
        }
        .navigationBarBackButtonHidden(true)
        
                /*NavigationLink(destination:MissionMapView(viewModel: MissionMapViewModel())){
                    Image(systemName: "xmark")
                        .foregroundColor(.orange)
                        .bold()
                    viewModel.unlockNextLevel()
                    
                    // Show map view
                    showMap = true
                }
                .offset(x:150 ,y:-370)
                 */
               
                
            }
            
        }
 



