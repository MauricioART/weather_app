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
            Image(country.enumValue.rawValue).resizable().frame(width: 140, height: 90)    
        }.padding()
    }
}

#Preview {
    Group{
    }
}
