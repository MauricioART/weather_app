//
//  WeatherInfo.swift
//  weather_app
//
//  Created by Diplomado on 13/02/25.
//

import Foundation

struct Weather: Codable{
    
    var location: Location
    var current: Current
    var uv: Double
    
    
    struct Location: Codable{
        var name: String
        var country: String
        var localtime: TimeInterval
        private var lat: Double
        private var lon: Double
    }
    
    struct Current: Codable{
        var last_updated_epoch: TimeInterval
        var temp_c: Double
        var temp_f: Double
        var isday: Bool
        var condition: Condition
        
        struct Condition: Codable{
            var icon: String
        }
    }
    
}
