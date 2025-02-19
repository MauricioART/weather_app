//
//  UbicationTab.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI
import CoreLocation

struct UbicationTab: View {
    @EnvironmentObject var dataManager: DataManager
    @State var weather: Weather
    
    var body: some View {
        // Obtener el país correspondiente con el nombre
        if let countryIndex = dataManager.countries.firstIndex(where: { $0.name == weather.location.name }) {
            // Crear un binding para la propiedad isFavorite
            let countryBinding = $dataManager.countries[countryIndex]
            
            let coordinate: CLLocationCoordinate2D = weather.location.coordinates
            var color: Color {
                if weather.current.isday {
                    return Color(red: 135/255, green: 206/255, blue: 235/255)
                } else {
                    return Color(red: 25/255, green: 25/255, blue: 112/255)
                }
            }
            
            ScrollView {
                VStack(alignment: .center) {
                    Text(weather.location.region)
                        .font(.title)
                        .padding()
                    WeatherInfo(weather: $weather)
                    MapView(coordinates: coordinate, country: dataManager.countries[countryIndex])
                    Text(weather.current.last_updated_epoch_str)
                        .font(.caption)
                        .padding()
                    Spacer()
                }
            }
            .navigationTitle(weather.location.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    // Pasar el Binding de isFavorite al FavoriteButton
                    FavoriteButton(isFavorite: countryBinding.isFavorite)
                }
            }
            .background(color)
        } else {
            // Mostrar algo si no se encuentra el país (aunque no debería pasar)
            Text("Country not found")
        }
    }
}
