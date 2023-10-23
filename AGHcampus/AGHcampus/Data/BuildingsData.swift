
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
    let officialName: String?
    let buildingImage: Image
    let address: String
    let buildingDescription: String
    let hasWiFi: Bool
    let accessibilityForWheelchairs: AccessibilityStatus
    let shape: [MKPolygon]
    let type: BuildingType
}

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
            type: .sport_object
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
            type: .auditorium
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
            type: .auditorium
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
            type: .auditorium
        )
    ]
}
