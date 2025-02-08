//
//  UbicationTab.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

struct UbicationTab: View {
    var body: some View {
        VStack(alignment: .center){
            WeatherInfo()
            MapView()
            Spacer()
            TabBarNavigation()
        }
    }
}

#Preview {
    UbicationTab()
}
