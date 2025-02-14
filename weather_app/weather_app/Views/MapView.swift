//
//  MapView.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI
import MapKit


struct MapView: View {
    @StateObject var weather: Weather
    @State var country: Country

    var body: some View {
        Map(initialPosition: .region(region)).frame(width: 300, height: 300, alignment: .center)
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: weather.location.coordinates,
            span: country.enumValue!.span
        )
    }
}


#Preview {
    MapView()
}
