import Foundation
import SwiftUI
import MapKit

struct BuildingCardView: View {
    let building: Building
    

    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Budynek " + building.symbol)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                if let name = building.officialName{
                    Text(name)
                        .font(.headline)
                        .accessibilityAddTraits(.isHeader)
                }
                
                // Accessibility for wheel chairs
                if building.accessibilityForWheelchairs == .limited {
                    Image("Image 2")
                        .foregroundColor(.gray)
                        .frame(width:20, height: 20)
                        .padding()
                } else if building.accessibilityForWheelchairs == .yes {
                    Image(systemName: "figure.roll")
                        .foregroundColor(.black)
                        .frame(width:20, height: 20)
                        .padding()
                }
                
                // Wi-Fi
                if building.hasWiFi {
                    Image("Image 2")
                        .foregroundColor(.gray)
                        .frame(width:20, height: 20)
                        .padding()
                } else {
                    Image(systemName: "figure.roll")
                        .foregroundColor(.black)
                        .frame(width:20, height: 20)
                        .padding()
                }
            }
            .font(.caption)
        }
        .padding()
//        .foregroundColor(scrum.theme.accentColor)
    }
    
}

struct BuildingCardView_Previews: PreviewProvider {
    static var example_building = BuildingData.buildings[0]
    static var previews: some View {
        BuildingCardView(building: example_building)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}