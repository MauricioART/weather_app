//
//  UbicationTab.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

struct UbicationTab: View {
    var weather: Weather
    var body: some View {
        VStack(alignment: .center){
            WeatherInfo(weather: weather)
            MapView()
            Spacer()
            TabBarNavigation()
        }
    }
}

#Preview {
    UbicationTab()
}
