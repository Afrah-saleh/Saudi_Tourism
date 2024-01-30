//
//  LevelDetailView.swift
//  Saudi_Tourism
//
//  Created by Afrah Saleh on 09/07/1445 AH.
//

import SwiftUI
import MapKit

struct LevelDetailView: View {
    @ObservedObject var viewModel: MissionMapViewModel
    let location: Location
    @EnvironmentObject private var vm: LocationViewModel
    var levelNumber: Int
    var body: some View {
        NavigationView{
            VStack {
                if location.activeLevel == levelNumber {
                    ScrollView{
                        VStack{
                            ZStack{
                                imageSection
                                    .shadow(color: .black.opacity(0.3), radius: 20, x:0, y:10)
                                Text(location.name)
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .padding(.top,350)
                                    .padding(.trailing,160)
                            }
                            VStack (alignment: .leading, spacing: 16){
                                titleSection
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
                NavigationLink(destination: MissionsView(viewModel: viewModel, vm: MissionViewModel(), levelNumber: levelNumber, popup: popupDataService.Congrats.first!)) {
                  //  NavigationLink(destination: test_button(viewModel: viewModel)){

                    ZStack{
                        Rectangle()
                            .frame(width: 340,height: 57)
                            .cornerRadius(13)
                            .tint(Color("BTCOLOR"))
                        
                        Text("Let’s Get Local !")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                }
            }
            .navigationBarTitle(("Place Info"), displayMode: .inline)
        }
        .navigationBarBackButtonHidden(true)

    }
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Embark on a new mission! 🌍"
        content.body = "Complete your exploration and uncover more surprises. The reward awaits – don't miss out! 🌴✨"
        content.sound = .default
        
        let twelveHoursInSeconds: TimeInterval = 12 * 60 * 60
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: twelveHoursInSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Notification error: \(error)")
            } else {
                print("Notification will be sent successfully after 12 hours")
            }
        }
    }
}

#Preview {
    LevelDetailView(viewModel: MissionMapViewModel(), location: LocationsDataService.locations.first!, levelNumber: 1)
}




extension LevelDetailView{
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
            Text("Where I am going ?")
                .font(.title2)
                .fontWeight(.semibold)
            HStack{
                Image(systemName: "mappin.and.ellipse")
                Text(location.name)
                    .font(.title3)
                    .foregroundColor(.black)
            }
        }
        .padding(.leading,10)
    }
    
    private var descriptionSection: some View{
        VStack(alignment: .leading,spacing: 8) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
        }
    
    private var mapLayer: some View {
        VStack{
            Text("Location")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.trailing,250)
            Map {
                Marker(location.name, coordinate: location.coordinates)
                    .tint(.orange)
            }
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
            // .mapStyle(.hybrid(elevation: .realistic))
            .onTapGesture {
                let destination = MKMapItem(placemark: MKPlacemark(coordinate: location.coordinates))
                destination.name = location.name
                destination.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
            }
        }
    }
}

