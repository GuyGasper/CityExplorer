//
//  CityExplorerApp.swift
//  CityExplorer
//
//  Created by Guy Gasper on 4/25/22.
//

import SwiftUI

@main
struct CityExplorerApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
