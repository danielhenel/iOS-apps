//
//  Building.swift
//  AGHcampus
//
//  Created by Guest User on 13/10/2023.
//

//import Foundation
//
import SwiftUI
import MapKit

// Enum reprezentujący dostępność dla wózków inwalidzkich
enum AccessibilityStatus {
    case limited
    case yes
    case no
}

// Enum reprezentujący rodzaj budynku
enum BuildingType: String {
    case academic = "Academic"
    case residential = "Residential"
    case office = "Office"
    case other = "Other"
    case university = "University"
}

struct Building: Identifiable {
    let id = UUID()
    let symbol: String
    let officialName: String?
    let buildingImage: Image?
    let address: String
    let buildingDescription: String
    let hasWiFi: Bool
    let accessibilityForWheelchairs: AccessibilityStatus
    let shape: [MKPolygon]
    let type: BuildingType
}

struct HashableBuilding: Hashable {
    let building: Building
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(building.id)
    }
    
    static func == (lhs: HashableBuilding, rhs: HashableBuilding) -> Bool {
        return lhs.building.id == rhs.building.id
    }
}

// Przykładowe dane budynków
struct BuildingData {
    static let buildings: [Building] = [
        Building(
            symbol: "Basen AGH",
            officialName: "Basen AGH",
            buildingImage: Image("Image 1"),
            address: "Jana Buszka 4, 30-150 Kraków",
            buildingDescription: "Basen AGH to miejsce rekreacji i sportu znajdujące się na terenie Akademii Górniczo-Hutniczej w Krakowie.",
            hasWiFi: false,
            accessibilityForWheelchairs: .yes,
            shape: [MKPolygon()],
            type: .residential
            ),
        Building(
            symbol: "A-0",
            officialName: "Budynek glowny",
            buildingImage: Image("A0"),
            address: "Mickiewicza 30",
            buildingDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            hasWiFi: true,
            accessibilityForWheelchairs: .yes,
            shape: [MKPolygon()],
            type: .university
        ),
        Building(
            symbol: "B-2",
            officialName: "Budynek B-2",
            buildingImage: Image("B2"),
            address: "Kościuszki 15",
            buildingDescription: "B-2 to nowoczesny obiekt, który oferuje przestronne sale wykladowe. Znajduje się w dogodnej lokalizacji w centrum miasta.",
            hasWiFi: true,
            accessibilityForWheelchairs: .no,
            shape: [MKPolygon()],
            type: .office
        ),
        Building(
            symbol: "C-3",
            officialName: "Budynek C-3",
            buildingImage: Image("C3"),
            address: "Nowa 5",
            buildingDescription: "C-3 to stylowy obiekt, który oferuje przestronne sale wykladowe.",
            hasWiFi: false,
            accessibilityForWheelchairs: .limited,
            shape: [MKPolygon()],
            type: .other
        )
    ]
}
