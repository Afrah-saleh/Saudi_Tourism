//
//  Mainview.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 21/07/1445 AH.
//

import SwiftUI

struct Mainview: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        if currentPage > totalPages {
            MissionMapView(viewModel: MissionMapViewModel())
        }
        
        else{
            Walkthrough()
        }
    }
}

#Preview {
    Mainview()
}
