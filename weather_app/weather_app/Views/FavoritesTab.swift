import SwiftUI

struct FavoritesTab: View {
    @StateObject var favorites = Weather().shared.favoriteCountries
    var body: some View {
        NavigationView{
            List{
                ForEach(favorites){ favorite in
                    image(favorite.enumValue!.rawValue)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
            .navigationTitle("Favoritos")
        }
    }
}