//
//  LocationDetailView.swift
//  level2
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    let location: Location
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ScrollView{
            VStack{
                imageSection
                    .shadow(color: .black.opacity(0.3), radius: 20, x:0, y:10)
                
                VStack (alignment: .leading, spacing: 16){
                   titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationViewModel())
}

extension LocationDetailView{
    private var imageSection: some View{
        TabView{
            ForEach(location.imageNames, id: \.self){
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View{
        VStack(alignment: .leading,spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var descriptionSection: some View{
        VStack(alignment: .leading,spacing: 8) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            if let url = URL(string: location.link){
                Link("Read more on Wikibidia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var mapLayer: some View{

        Map {
                Marker(location.name, coordinate: location.coordinates)
                .tint(.orange)
            
    
               }
       // .mapStyle(.hybrid(elevation: .realistic))
        
        .allowsHitTesting(false) //not moving the map
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
        
    }
}

