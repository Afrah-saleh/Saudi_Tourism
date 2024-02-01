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
    // Declare a published property to track the currently active level. Changes to this will update the observing views.
    @Published var activeLevel: Int = 1
    // An array to store all location data.
    let locations: [Location]
    
    // Computed property to filter locations based on the active level.
     var locationss: [Location] {
        self.locations.filter { $0.activeLevel == activeLevel }
    }

    // Published property for the current location displayed on the map. When it changes, 'updateMapRegion' is called.
    // Current location on map
    @Published var mapLocation: Location {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Published property for the map region displayed by the map view. Initialized with a default value.
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    // Constant defining the span of the map region. Determines how zoomed in the map is.
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Initializer for the class, which sets up the initial state.
    init(){
        // Retrieve locations from a data service.
        let locations = LocationsDataService.locations
        self.locations = locations // Store the retrieved locations.
        self.mapLocation = locations.first!  // Set the initial map location to the first in the array.
        // Update the map region to center on the first location.
        self.updateMapRegion(location: locations.first!)
    }
    
    // Private method to update the map region based on a given location.
    private func updateMapRegion(location: Location){
        // Animate the update of the map region.
        withAnimation(.easeInOut){
            // Set the map region to center on the location's coordinates with the predefined span.
            mapRegion = MKCoordinateRegion(
                center: location.coordinates, span: mapSpan
            )
        }
    }
}
