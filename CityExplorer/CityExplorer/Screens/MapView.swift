//
//  ContentView.swift
//  CityExplorer
//
//  Created by Guy Gasper on 4/25/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: MapDefaults.latitude,
                                       longitude: MapDefaults.longitude),
        span: MKCoordinateSpan(latitudeDelta: CLLocationDegrees(MapDefaults.zoom),
                               longitudeDelta: CLLocationDegrees(MapDefaults.zoom)))
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .systemGray6
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
      NavigationView {
        Map(coordinateRegion: $region)
            .navigationBarTitleDisplayMode(.inline)
                      .toolbar {
                          ToolbarItem(placement: .principal) {
                              HStack {
                                  Text("City Explorer").font(.largeTitle)
                                  Label("SwiftUI Tutorials", systemImage: "map")
                              }
                          }
                      }
            .ignoresSafeArea()
      }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewDevice("iPhone 11")
    }
}
