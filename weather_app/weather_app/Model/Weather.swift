//
//  WeatherInfo.swift
//  weather_app
//
//  Created by Diplomado on 13/02/25.
//

import Foundation
import CoreLocation

struct Weather: Codable{
    
    var location: Location
    var current: Current
    var uv: Double
    
    
    struct Location: Codable{
        var name: String
        var country: String
        var region: String
        private var localtime: TimeInterval
        private var lat: Double
        private var lon: Double
        var coordinates : CLLocationCoordinate2D{
            CLLocationCoordinate2D(latitude: lat, longitude: lon)
        }

        var localtime_str: String{
            let date = Date(timeIntervalSince1970: localtime)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            return dateFormatter.string(from: date)
        }

    }
    
    struct Current: Codable{
        private var last_updated_epoch: TimeInterval
        var last_updated_epoch_str: String{
            let date = Date(timeIntervalSince1970: last_updated_epoch)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            return dateFormatter.string(from: date)
        }
        var temp_c: Double
        var temp_f: Double
        var isday: Bool
        var condition: Condition
        
        struct Condition: Codable{
            var icon: String
        }
    }
    
}
