//
//  ModelData.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import Foundation

var modelData = ModelData()

class ModelData{
    private let apiUrl = "http://api.weatherapi.com/v1/current.json"
    
    var countries : [Country] = load("LocationList.json")
    
    func getWeather(from country: String, completion: @escaping (Weather?, Error?) -> Void) {
        guard countries.contains(where: {$0.name == country}) else { return }
        guard var urlComponents = URLComponents(string: apiUrl) else {
            print("URL inválida")
            return
        }
        let apiKey = "fc45889b743d452dbdb25953243107"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: country),
            URLQueryItem(name:"aqi", value: "no")
        ]
        
        // Verificar si la URL final es válida
        guard let url = urlComponents.url else {
            print("Error construyendo la URL con los parámetros")
            return
        }
        
        // 3. Crear la solicitud GET
        let request = URLRequest(url: url)
        
        // 4. Realizar la solicitud usando URLSession
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Manejo de errores
            if let error = error {
                print("Error al hacer la solicitud: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No se recibió ningún dato")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weather = try decoder.decode(Weather.self, from: data)
                completion(weather,nil)
            } catch {
                completion(nil,error)
            }
        }
        
        // 5. Iniciar la solicitud
        task.resume()
        
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
