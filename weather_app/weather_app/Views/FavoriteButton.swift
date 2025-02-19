//
//  FavoritesButton.swift
//  weather_app
//
//  Created by Diplomado on 13/02/25.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isFavorite: Bool
    
    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isFavorite ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isFavorite ? .blue : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isFavorite: .constant(true))
}
