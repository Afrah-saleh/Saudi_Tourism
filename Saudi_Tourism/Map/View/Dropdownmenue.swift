//
//  Dropdownmenue.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 10/07/1445 AH.
//

import SwiftUI

enum DropDownPickerState {
    case top
    case bottom
}
struct Dropdownmenue: View {
    @Binding var selection: String?
    var state: DropDownPickerState = .bottom
    var options: [String]
    var maxWidth: CGFloat = 180
    
    @State var showDropdown = false
    
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State var zindex = 1000.0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                
                
                if state == .top && showDropdown {
                    OptionsView()
                }
                
                HStack {
                    Spacer() // Spacer before to push content to center
                    Text(selection == nil ? "Select" : selection!)
                        .foregroundColor(selection != nil ? .black : .gray)
                    Image(systemName: state == .top ? "chevron.up" : "chevron.down")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                    Spacer() // Spacer after to ensure centering
                }
                
                .frame(width: maxWidth, height: 30) // Use maxWidth for the frame width
                .background(.white)
                //.padding(.horizontal, 15)
                .padding(.all)
                .frame(width: 200, height: 30)
                .background(.white)
                .contentShape(.rect)
                .onTapGesture {
                    index += 1
                    zindex = index
                    withAnimation(.snappy) {
                        showDropdown.toggle()
                    }
                }
                
                .zIndex(10)
                
                if state == .bottom && showDropdown {
                    OptionsView()
                }
            }
            .clipped()
            .background(.white)
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray)
            }
            .frame(height: size.height, alignment: state == .top ? .bottom : .top)
            
        }
        .frame(width: maxWidth, height: 30)
        .zIndex(zindex)
      //  .shadow(color: .gray, radius: 5, x: 0, y: 0.5)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 3, y: 5)
        .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
        
    }
    
    
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                HStack {
                    Text(option).frame(maxWidth: .infinity, alignment: .center) // Center the text within the frame
                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(selection == option ? 1 : 0)
                }
                .foregroundStyle(selection == option ? Color.primary : Color.gray)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .padding(.horizontal, 15)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = option
                        showDropdown.toggle()
                    }
                }
            }
        }
        .transition(.move(edge: state == .top ? .bottom : .top))
        .zIndex(1)
    }
}
    

