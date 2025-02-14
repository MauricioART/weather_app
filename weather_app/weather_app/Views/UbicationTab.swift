//
//  UbicationTab.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

struct UbicationTab: View {
    @StateObject var weather: Weather
    var body: some View {
        var color: Color{
            if weather.current.isday{
                return Color(red: 135/255, green: 206/255, blue: 235/255)
            }else{
                return Color(red: 25/255, green: 25/255, blue: 112/255)
            }
        }
        ScrollView{
            VStack(alignment: .center){
                Text(weather.location.region)
                    .font(.title)
                    .padding()
                WeatherInfo(weather: $weather)
                MapView(weather: $weather)
                Text(weather.current.last_updated_epoch_str)
                    .font(.caption)
                    .padding()
                Spacer()
            }
        }.navigationTitle(weather.location.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) { 
                FavoriteButton(isFavorite: $weather.isFavorite)
            }
        }
        .background(color)
    }
    
}

#Preview {
    UbicationTab()
}
