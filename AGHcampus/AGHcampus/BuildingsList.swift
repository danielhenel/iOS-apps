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

struct BuildingCardView: View {
    let building: Building
    
    var body: some View {
        let backgroundColor = BuildingTheme.backgroundColor(for: building.type)
        let textColor = BuildingTheme.textColor(for: backgroundColor)
        let wheelchairIconColor = BuildingTheme.wheelchairIconColor(for: building.accessibilityForWheelchairs)
        let wifiIconColor = BuildingTheme.wifiIconColor(for: building.hasWiFi)
        
        ZStack {
            backgroundColor
                .cornerRadius(10)
                .frame(height: 200)
            VStack {
                Text(building.symbol)
                    .font(.title)
                    .foregroundColor(textColor)
                if let officialName = building.officialName {
                    Text(officialName)
                        .font(.headline)
                        .foregroundColor(textColor)
                }
                HStack {
                    Image(systemName: "wifi")
                        .foregroundColor(wifiIconColor)
                    Image(systemName: "wheelchair")
                        .foregroundColor(wheelchairIconColor)
                }
            }
        }
        .padding()
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
