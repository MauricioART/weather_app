//
//  CountryList.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

struct CountryList: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedCountryWeather: Weather?  // Estado para almacenar el clima del país seleccionado
    @State private var isLoading = false  // Estado para indicar si estamos cargando el clima
    @State private var errorMessage: String?  // Estado para manejar errores

    var body: some View {
        NavigationSplitView {
            List(dataManager.countries) { country in
                Button(action: {
                    fetchWeather(for: country)
                }) {
                    CountryRow(country: country)
                }
            }
        } detail: {
            if let weather = selectedCountryWeather {
                // Mostrar la vista con la información del clima
                TabBarNavigation(weather: weather)
            } else if isLoading {
                // Mostrar cargando mientras esperamos la respuesta
                ProgressView("Loading weather...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else if let errorMessage = errorMessage {
                // Mostrar el error si ocurrió
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                // Mensaje por defecto
                Text("Select a Country")
            }
        }
    }
    
    func fetchWeather(for country: Country) {
        isLoading = true
        errorMessage = nil  // Limpiar el error en cada nueva solicitud

        dataManager.fetchWeather(from: country.name) { weather, error in
            isLoading = false
            if let weather = weather {
                selectedCountryWeather = weather
            } else {
                errorMessage = error?.localizedDescription ?? "Unknown error"
            }
        }
    }
}

