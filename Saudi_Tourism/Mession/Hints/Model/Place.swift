//
//  Place.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 12/07/1445 AH.
//

import Foundation

struct Place: Hashable, Identifiable {
    let id = UUID()
    let level: Int
    let name: String
    let image: String
    let desc: String
}
