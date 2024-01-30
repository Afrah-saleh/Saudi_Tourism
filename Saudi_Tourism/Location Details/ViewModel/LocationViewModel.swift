//
//  LocationViewModel.swift
//  level2
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    @Published var activeLevel: Int = 1
    
    let locations: [Location]
    
     var locationss: [Location] {
        self.locations.filter { $0.activeLevel == activeLevel }
    }
    //All loaded locations
   // @Published var locations: [Location]
    

    // Current location on map
    @Published var mapLocation: Location {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates, span: mapSpan
            )
        }
    }
}
