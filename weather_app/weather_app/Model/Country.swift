//
//  Country.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import Foundation

struct Country : Codable, Hashable, Identifiable{
    var id : Int
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name = "nombre"
    }
}
