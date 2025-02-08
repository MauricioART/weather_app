//
//  CountryRow.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

struct CountryRow: View {
    var country : Country
    var body: some View {
        HStack(alignment:.center){
            Text(country.name).padding(.trailing)
            Spacer()
                if country.name != "Canada"{
                    Image(country.name).resizable().frame(width: 140, height: 90)
                    
                }
                else{
                    Image("CanadáCA").resizable().frame(width: 140, height: 90)
                }
            }.padding()
        }
}

#Preview {
    Group{
        CountryRow(country: countries[0])
        CountryRow(country: countries[2])
        CountryRow(country: countries[3])
        CountryRow(country: countries[4])
        CountryRow(country: countries[5])
    }
}
