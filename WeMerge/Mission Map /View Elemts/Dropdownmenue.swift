//
//  Dropdownmenue.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 10/07/1445 AH.
//


import SwiftUI

// Define an enumeration to represent the dropdown menu's expanded state.

enum DropDownPickerState {
    case top
    case bottom
}


// Declare a structure for the Dropdownmenue, conforming to the View protocol.
struct Dropdownmenue: View {
    // Use a binding to a String optional to represent the selected item in the dropdown.
    @Binding var selection: String?
    // Specify the initial state of the dropdown menu; default is .bottom.
    var state: DropDownPickerState = .bottom
    // Hold the options to be displayed in the dropdown.
    var options: [String]
    // Define the maximum width for the dropdown menu; default is 180.
    var maxWidth: CGFloat = 180
    // Use a state variable to track whether the dropdown is currently shown.
    @State var showDropdown = false
    
    // Use SceneStorage to persist the z-index value across app launches.
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State var zindex = 1000.0
    
  
    
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                
                // Conditionally show the options view above the dropdown if appropriate.
                if state == .top && showDropdown {
                    OptionsView()
                }
                
                
                HStack {
                    Spacer() // Spacer before to push content to center
                    Text(selection == nil ? "Select" : selection!)
                           .foregroundColor(selection != nil ? .black : .gray)
                           .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
                       Spacer() // Pushes the chevron to the right
                       Image(systemName: state == .top ? "chevron.up" : "chevron.down")
                           .font(.title3)
                           .foregroundColor(Color("BTCOLOR"))
                           .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                   }
                
                .frame(width: maxWidth, height: 30) // Use maxWidth for the frame width
                .background(Color("dropColor"))
                .padding(.all)
                .frame(width: 200, height: 30)
                .background(Color("dropColor"))
                .contentShape(Rectangle())
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
            .background(Color("dropColor"))
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("dropColor"))
            }
            .frame(height: size.height, alignment: state == .top ? .bottom : .top)
            
        }
        .frame(width: maxWidth, height: 30)
        .zIndex(zindex)
        
    }
    
    
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                HStack {
                    Text(option).frame(maxWidth: .infinity, alignment: .center) // Center the text within the frame
                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(selection == option ? 1 : 0)
                        .foregroundColor(Color("BTCOLOR"))
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

    


