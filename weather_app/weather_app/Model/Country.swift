//
//  Country.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import Foundation
import MapKit

// Modelo de datos decodable desde JSON
struct Country: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var isFavorite: Bool?
    var enumValue: CountryEnum {
        return CountryEnum(countryID: id)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case name = "nombre"
        case isFavorite
    }
}

// Enum que representa los países con su span
enum CountryEnum: String, CaseIterable {
    case london = "London"
    case canada = "CanadáCa"
    case mexico = "Mexico"
    case brazil = "Brazil"
    case argentina = "Argentina"
    case spain = "Spain"
    case france = "France"
    case germany = "Germany"
    case japan = "Japan"
    case china = "China"
    case none = "None"

    init(countryID: Int) {
        self = CountryEnum(rawValue: CountryEnum.countryName(for: countryID)) ?? .none
    }

    private static func countryName(for countryID: Int) -> String {
        switch countryID {
            case 1: return "London"
            case 2: return "CanadáCa"
            case 3: return "Mexico"
            case 4: return "Brazil"
            case 5: return "Argentina"
            case 6: return "Spain"
            case 7: return "France"
            case 8: return "Germany"
            case 9: return "Japan"
            case 10: return "China"
            default: return "None"
        }
    }

    /// Span para el mapa
    var span: MKCoordinateSpan {
        switch self {
        case .london:
            return MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        case .canada, .china:
            return MKCoordinateSpan(latitudeDelta: 50.0, longitudeDelta: 60.0)
        case .mexico:
            return MKCoordinateSpan(latitudeDelta: 15.0, longitudeDelta: 15.0)
        case .brazil:
            return MKCoordinateSpan(latitudeDelta: 40.0, longitudeDelta: 40.0)
        case .argentina:
            return MKCoordinateSpan(latitudeDelta: 20.0, longitudeDelta: 18.0)
        case .spain:
            return MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 12.0)
        case .france, .germany:
            return MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)
        case .japan:
            return MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 15.0)
        case .none:
            return MKCoordinateSpan(latitudeDelta: 0.0, longitudeDelta: 0.0)
        }
    }
}
