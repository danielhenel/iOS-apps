
import Foundation
import SwiftUI
import MapKit


enum AccessibilityStatus {
    case limited
    case yes
    case no
}

enum BuildingType: String {
    case auditorium = "Auditorium"
    case student_dormitory = "Student Dormitory"
    case office = "Office"
    case other = "Other"
    case labolatory = "Labolatory"
    case sport_object = "Sport Object"
    case library = "Library"
}

struct Building {
    let symbol: String
    let name: String
    let wifi: Bool
    let wheelchair: AccessibilityStatus
    let floors: Int
    let street: String
    let houseNumber: String
    let postcode: String
    let city: String
    let description: String
    let type: String
    let polygon: [MKPolygon]
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case name
        case wifi
        case wheelchair
        case floors
        case street
        case houseNumber
        case postcode
        case city
        case description
        case type
        case polygon
        case image
    }
    
}


extension Building: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        symbol = try values.decode(String.self, forKey: .symbol)
        name = try values.decode(String.self, forKey: .name)
        wifi = try values.decode(Bool.self, forKey: .wifi)
       // wheelchair = try values.decode(Double.self, forKey: .wheelchair)
        floors = try values.decode(Int.self, forKey: .floors)
        street = try values.decode(String.self, forKey: .street)
        houseNumber = try values.decode(String.self, forKey: .houseNumber)
        postcode = try values.decode(String.self, forKey: .postcode)
        city = try values.decode(String.self, forKey: .city)
        description = try values.decode(String.self, forKey: .description)
//        type = try values.decode(Double.self, forKey: .type)
//        polygon = try values.decode(Double.self, forKey: .polygon)
//        image = try values.decode(Double.self, forKey: .image)
        
//        let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
//        elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
    }
}


extension Building: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(symbol, forKey: .symbol)
        try container.encode(name, forKey: .name)
        try container.encode(wifi, forKey: .wifi)
    //    try container.encode(wheelchair, forKey: .wheelchair)
        try container.encode(floors, forKey: .floors)
        try container.encode(street, forKey: .street)
        try container.encode(houseNumber, forKey: .houseNumber)
        try container.encode(postcode, forKey: .postcode)
        try container.encode(city, forKey: .city)
        try container.encode(description, forKey: .description)
        try container.encode(type, forKey: .type)
       // try container.encode(polygon, forKey: .polygon)
        try container.encode(image, forKey: .image)
        
//        var additionalInfo = container.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
//        try additionalInfo.encode(elevation, forKey: .elevation)
    }
}
