import SwiftUI

struct FavoritesTab: View {
    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        NavigationView{
            List{
                ForEach(dataManager.favoriteCountries){ favorite in
                    Image(favorite.enumValue.rawValue)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
            .navigationTitle("Favoritos")
        }
    }
}
