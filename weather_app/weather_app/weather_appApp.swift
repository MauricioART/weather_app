//
//  weather_appApp.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

@main
struct weather_appApp: App {
    @StateObject private var dataManager = DataManager.shared
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            CountryList()
            .onChange(of: scenePhase) { newPhase in
                    if newPhase == .background || newPhase == .inactive {
                        dataManager.saveCountriesData()
                    }
                }
        }
    }
}
