
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
    let buildingMap: Image
    let address: String
    let buildingDescription: String
    let hasWiFi: Bool
    let accessibilityForWheelchairs: AccessibilityStatus
    let shape: [MKPolygon]
    let type: BuildingType
    let favourite: Bool?
}

struct BuildingData {
    static let buildings: [Building] = [
        Building(
            symbol: "U-11",
            officialName: "Basen AGH",
            buildingImage: Image("U11"),
            buildingMap: Image("U11_map"),
            address: "Jana Buszka 4, 30-150 Kraków",
            buildingDescription: "Basen AGH to miejsce rekreacji i sportu znajdujące się na terenie Akademii Górniczo-Hutniczej w Krakowie.",
            hasWiFi: false,
            accessibilityForWheelchairs: .yes,
            shape: [MKPolygon()],
            type: .sport_object,
            favourite: nil
            ),
        Building(
            symbol: "A-0",
            officialName: "Budynek glowny",
            buildingImage: Image("A0"),
            buildingMap: Image("A0_map"),
            address: "Mickiewicza 30",
            buildingDescription: "Budynek Główny uwieńczony jest figurą Św. Barbary na dachu.",
            hasWiFi: true,
            accessibilityForWheelchairs: .yes,
            shape: [MKPolygon()],
            type: .auditorium,
            favourite: nil
        ),
        Building(
            symbol: "B-2",
            officialName: "Wydzial EAIiIB",
            buildingImage: Image("B2"),
            buildingMap: Image("B2_map"),
            address: "Kościuszki 15",
            buildingDescription: "B-2 to nowoczesny obiekt, który oferuje przestronne sale wykladowe. Znajduje się w dogodnej lokalizacji w centrum miasta.",
            hasWiFi: true,
            accessibilityForWheelchairs: .no,
            shape: [MKPolygon()],
            type: .auditorium,
            favourite: nil
        ),
        Building(
            symbol: "C-3",
            officialName: "Budynek miedzywydzialowy",
            buildingImage: Image("C3"),
            buildingMap: Image("C3_map"),
            address: "Nowa 5",
            buildingDescription: "C-3 to stylowy obiekt, który oferuje przestronne sale wykladowe.",
            hasWiFi: false,
            accessibilityForWheelchairs: .limited,
            shape: [MKPolygon()],
            type: .auditorium,
            favourite: nil
        ),
        Building(
            symbol: "D-17",
            officialName: "Centrum Informatyki",
            buildingImage: Image("D17"),
            buildingMap: Image("D17_map"),
            address: "Kawiory 21",
            buildingDescription: "Centrum Informatyki jest nowoczesnym budykiem, wyposażonym w najnowsze techologie.",
            hasWiFi: true,
            accessibilityForWheelchairs: .yes,
            shape: [MKPolygon()],
            type: .labolatory,
            favourite: nil
        ),
        Building(
            symbol: "DS-14",
            officialName: "Dom Studencki Kapitol",
            buildingImage: Image("DS14"),
            buildingMap: Image("DS14_map"),
            address: "Nowa 5",
            buildingDescription: "Legendarny akademik w samym centrum miasteczka studenckiego.",
            hasWiFi: false,
            accessibilityForWheelchairs: .no,
            shape: [MKPolygon()],
            type: .student_dormitory,
            favourite: nil
        )
    ]
}
