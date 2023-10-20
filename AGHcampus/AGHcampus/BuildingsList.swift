//
//  BuildingsList.swift
//  AGHcampus
//
//  Created by Guest User on 13/10/2023.
//

import Foundation

import SwiftUI

struct BuildingTheme {
    static func backgroundColor(for buildingType: BuildingType) -> Color {
        switch buildingType {
            case .academic:
                return Color("AcademicBackground")
            case .residential:
                return Color("ResidentialBackground")
            case .office:
                return Color("OfficeBackground")
            case .other:
                return Color("OtherBackground")
            default:
                return Color("DefaultBackground") // Fallback color
        }
    }
    
    static func textColor(for backgroundColor: Color) -> Color {
            // Convert SwiftUI Color to UIColor
            let uiColor = UIColor(backgroundColor)
            
            // Calculate brightness
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            uiColor.getRed(&red, green: &green, blue: &blue, alpha: nil)
            let brightness = (red * 299 + green * 587 + blue * 114) / 1000
            
            return brightness < 0.5 ? .white : .black
        }
    
    static func wheelchairIconColor(for accessibilityStatus: AccessibilityStatus) -> Color {
        return accessibilityStatus == .yes ? .black : .gray
    }
    
    static func wifiIconColor(for hasWiFi: Bool) -> Color {
        return hasWiFi ? .blue : .gray
    }
}



struct BuildingDetailView: View {
    let building: Building

    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

struct BuildingListView: View {
    let buildings: [Building]

    var body: some View {
        List(buildings.map { HashableBuilding(building: $0) }, id: \.self) { hashableBuilding in
            NavigationLink(destination: BuildingDetailView(building: hashableBuilding.building)) {
                BuildingCardView(building: hashableBuilding.building)
            }
        }
        .navigationTitle("Lista Budynków")
    }
}
