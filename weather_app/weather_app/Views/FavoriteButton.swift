//
//  FavoritesButton.swift
//  weather_app
//
//  Created by Diplomado on 13/02/25.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .blue : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
