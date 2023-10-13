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
}

struct Building {
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


// Przykładowe dane budynków
struct BuildingData {
    static let buildings: [Building] = [
        Building
        Building(
            symbol: "Budynek A-1",
            officialName: "Akademik Studencki A-1",
            buildingImage: Image("BuildingImage1"),
            address: "Mickiewicza 30",
            buildingDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            hasWiFi: true,
            accessibilityForWheelchairs: .yes,
            shape: [MKPolygon()],
            type: .residential
        ),
        Building(
            symbol: "Budynek B-2",
            officialName: "Biurowiec B-2",
            buildingImage: Image("BuildingImage2"),
            address: "Kościuszki 15",
            buildingDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            hasWiFi: true,
            accessibilityForWheelchairs: .no,
            shape: [MKPolygon()],
            type: .office
        ),
        Building(
            symbol: "Budynek C-3",
            officialName: nil,
            buildingImage: nil,
            address: "Nowa 5",
            buildingDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            hasWiFi: false,
            accessibilityForWheelchairs: .limited,
            shape: [MKPolygon()],
            type: .other
        )
    ]
}
