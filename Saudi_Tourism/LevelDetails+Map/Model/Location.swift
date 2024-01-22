//
//  Locations.swift
//  level2
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import Foundation
import MapKit

struct Location: Identifiable {
  //  let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String{  //identifibale
        //name = "Colosseum"
        //cityName = "Rome"
        //id = "ColosseumRome"
        name + cityName
    }
}
