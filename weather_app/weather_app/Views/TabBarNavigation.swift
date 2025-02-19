//
//  TabBarNavigation.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

struct TabBarNavigation: View {
    
    @State var weather: Weather
    
    var body: some View {
        TabView {
            UbicationTab(weather: weather)
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Ubicación")
                }

            FavoritesTab()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favoritos")
                }
        }
        .frame(height: 90)
        .foregroundStyle(.gray)
        .background(.gray.opacity(0.4))
    }
}
