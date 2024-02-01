//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Nick Sarno on 11/26/21.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Turaif Neighborhood",
            cityName: "",
            coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            description: "The historic Al-Turaif neighborhood, included in the UNESCO World Heritage List since 2010, reflects an architecture that shines with the cultural and scientific development of the Kingdom of Saudi Arabia.",
            imageNames: "PlaceLvl1",
            link: "https://en.wikipedia.org/wiki/Colosseum", activeLevel: 1),
        
        
        Location(
            name: "Al-Muaqiliyah Commercial Center",
            cityName: "",
            coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
            description: "The market is considered one of the parts of the Qasr Al-Hakam commercial area. Al-Muaiqilia Market is unique in that it has various stores and distinctive products, and its stores and outlets are numerous and reach approximately 1,000 stores.",
            imageNames: "PlaceLvl2",

            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome", activeLevel: 2),
        
        
        Location(
            name: "Red sand dunes",
            cityName: "",
            coordinates: CLLocationCoordinate2D(latitude: 41.9009, longitude: 12.4833),
            description: "Red Sands is an area of red desert sand dunes in northeastern Riyadh, Saudi Arabia. The area is a weekend destination among Saudis. The area known as the Hidden Valley is surrounded by towering mountains that give the appearance of a valley.",
            imageNames: "PlaceLvl3",
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain", activeLevel: 3),
       
        Location(
            name: "Ain Hit Cave",
            cityName: "",
            coordinates: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
            description: "The geological landmark around which interesting stories revolve. You are on a date with one of the most beautiful natural monuments, which is thousands of years old and has exciting stories told about it.",
            imageNames: "PlaceLvl4",
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower", activeLevel: 4),
    ]
    
}
