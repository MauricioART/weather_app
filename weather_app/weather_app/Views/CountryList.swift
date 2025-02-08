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
            List(countries){ country in
                NavigationLink {
                    UbicationTab()
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
