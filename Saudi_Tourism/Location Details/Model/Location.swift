//
//  Locations.swift
//  level2
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: String
    let link: String
    var activeLevel: Int
    
    var id: String{
        name + cityName
    }
}
