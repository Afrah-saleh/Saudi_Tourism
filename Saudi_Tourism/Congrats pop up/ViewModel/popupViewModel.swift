//
//  popupViewModel.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 18/07/1445 AH.
//

import Foundation
class popupViewModel: ObservableObject{
    @Published var activeLevel: Int = 1 
        var Popup: [popupModel]
    
    init() {
        self.Popup = popupDataService.Popup
    }
}
