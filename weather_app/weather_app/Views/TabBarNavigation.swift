//
//  TabBarNavigation.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

struct TabBarNavigation: View {
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Image(systemName: "mappin.and.ellipse")
                Text("Ubicación").bold()
            }
            Spacer()
            VStack{
                Image(systemName: "star")
                Text("Favoritos").bold()
            }
            Spacer()
        }
        .frame(height: 90)
        .foregroundStyle(.gray)
        .background(.gray.opacity(0.4))
    }
}

#Preview {
    TabBarNavigation()
}
