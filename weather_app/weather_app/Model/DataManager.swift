
import Foundation

class DataManager :ObservableObject{
    
    private let apiUrl = "http://api.weatherapi.com/v1/current.json"
    private let countryListFileName = "LocationList.json"
    
    @Published var countries: [Country] = []
    var favoriteCountries: [Country] {
        return countries.filter { $0.isFavorite == true }
    }

    static let shared = DataManager()

    private init() {
        copyCountryToDocumentsIfNeeded()
        countries = loadCountriesData()
    }

    private func getCountryFileURL() -> URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(countryListFileName)")
    }
    
    func getCountry(name : String) -> Country?{
        return countries.first(where: {$0.name == name})
    }
    
    private func copyCountryToDocumentsIfNeeded(){
        let fileManager = FileManager.default
        guard let bundleURL = Bundle.main.url(forResource: countryListFileName, withExtension: nil),
              let documentURL = getCountryFileURL() else { return }
        
        if !fileManager.fileExists(atPath: documentURL.path) {
            do {
                try fileManager.copyItem(at: bundleURL, to: documentURL)
            } catch {
                print("Error copying \(countryListFileName): \(error)")
            }
        }
    }
    func loadCountriesData()->[Country]{
        guard let fileURL = getCountryFileURL(),
              let countryData = try? Data(contentsOf: fileURL),
              let countryList = try? JSONDecoder().decode([Country].self, from: countryData) else {
            print("Cannot load \(countryListFileName)")
            return []
        }
        return countryList
    }
    func fetchWeather(from country: String, completion: @escaping (Weather?, Error?) -> Void) {
        guard countries.contains(where: { $0.name == country }) else { return }

        guard var urlComponents = URLComponents(string: apiUrl) else {
            print("Invalid URL")
            return
        }

        let apiKey = "fc45889b743d452dbdb25953243107"
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: country),
            URLQueryItem(name: "aqi", value: "no")
        ]

        guard let url = urlComponents.url else {
            print("Error constructing the URL with parameters")
            return
        }

        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error.localizedDescription)")
                completion(nil, error)
                return
            }

            guard let data = data else {
                print("No data received")
                completion(nil, NSError(domain: "com.weatherapi", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Received non-200 HTTP status")
                completion(nil, NSError(domain: "com.weatherapi", code: -1, userInfo: [NSLocalizedDescriptionKey: "Received non-200 HTTP status"]))
                return
            }

            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(Weather.self, from: data)
                completion(weather, nil)
            } catch {
                print("Error decoding response: \(error)")
                completion(nil, error)
            }
        }
        
        task.resume()
    }

    func updateFavoriteStatus(for country: Country) {
        if let index = countries.firstIndex(where: { $0.id == country.id }) {
            countries[index].isFavorite = country.isFavorite
        }
    }

    func saveCountriesData(){
         guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Couldn't find documents directory")
            return
        }
        
        let filename = "\(countryListFileName)"
        let fileURL = documentsDirectory.appendingPathComponent(filename)
        
        do {
            let countriesData = try JSONEncoder().encode(countries)
            try countriesData.write(to: fileURL, options: .atomic)
        } catch {
            print("Cannot encode countries: \(error.localizedDescription)")
        }
    }
    
}
