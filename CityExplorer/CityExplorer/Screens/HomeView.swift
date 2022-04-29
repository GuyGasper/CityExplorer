//
//  ContentView.swift
//  CityExplorer
//
//  Created by Guy Gasper on 4/25/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct HomeView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: MapDefaults.latitude,
                                        longitude: MapDefaults.longitude),
        span: MKCoordinateSpan(latitudeDelta: CLLocationDegrees(MapDefaults.zoom),
                                longitudeDelta: CLLocationDegrees(MapDefaults.zoom)))

      @State private var lineCoordinates = [
        CLLocationCoordinate2D(latitude: MapDefaults.latitude, longitude: MapDefaults.longitude),
        CLLocationCoordinate2D(latitude: MapDefaults.latitude + 1, longitude: MapDefaults.longitude - 1)
      ];
    
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
          MapView(region: region, lineCoordinates: lineCoordinates)
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
    private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: MapDefaults.latitude,
                                        longitude: MapDefaults.longitude),
        span: MKCoordinateSpan(latitudeDelta: CLLocationDegrees(MapDefaults.zoom),
                                longitudeDelta: CLLocationDegrees(MapDefaults.zoom)))

    private var lineCoordinates = [
        CLLocationCoordinate2D(latitude: MapDefaults.latitude, longitude: MapDefaults.longitude)
    ];
    
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11")
    }
}
