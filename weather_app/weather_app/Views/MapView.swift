//
//  MapView.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI
import MapKit


struct MapView: View {
    
    var body: some View {
        Map(initialPosition: .region(region)).frame(width: 300, height: 300, alignment: .center)
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}


#Preview {
    MapView()
}
