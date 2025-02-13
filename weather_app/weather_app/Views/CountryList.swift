//
//  CountryList.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

struct CountryList: View {
    
    var body: some View {
        NavigationSplitView {
            List(modelData.countries){ country in
                NavigationLink {
                    modelData.getWeather(from: country.name){
                        weather, error in
                        if let weather {
                            UbicationTab(weather: weather)
                        }
                        else{
                            
                        }
                    }
                } label: {
                    CountryRow(country: country)
                }
            }
        }detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CountryList()
}
