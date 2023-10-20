//
//  BuildingCardView.swift
//  AGHcampus
//
//  Created by Guest User on 20/10/2023.
//

import Foundation
import SwiftUI
import MapKit

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

struct BuildingCardView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingCardView(building:BuildingData.buildings[0])
    }
}
