//
//  Saudi_TourismApp.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import SwiftUI
import SwiftData

@main
struct Saudi_TourismApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Stamps.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            MissionMapView(viewModel: MissionMapViewModel())
        }
        
    }
}
