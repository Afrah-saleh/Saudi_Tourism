//
//  ActiveSheet.swift
//  Saudi_Tourism
//
//  Created by Muna Aiman Al-hajj on 18/07/1445 AH.
//

import SwiftUI
import Foundation

enum ActiveSheet: Identifiable {
    case first, second, third

    var id: Int {
        switch self {
            case .first: return 0
            case .second: return 1
            case .third: return 2
        }
    }
}
