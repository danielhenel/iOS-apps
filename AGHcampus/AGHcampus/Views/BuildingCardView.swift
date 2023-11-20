import Foundation
import SwiftUI
import MapKit

struct BuildingCardView: View {
    var building: Building
    
    var body: some View {
        VStack(alignment: .leading) {
            // Symbol
            Text("Budynek " + building.symbol)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            HStack {
                // Official name (if exists)
                if let name = building.name{
                    Text(name)
                        .font(.headline)
                        .accessibilityAddTraits(.isHeader)
                }
                
                // Accessibility for wheel chairs
                if building.wheelchair == .limited {
                    Image(systemName: "figure.roll")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width:20, height: 20)
                        .padding()
                } else if building.wheelchair == .yes {
                    Image(systemName: "figure.roll")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width:20, height: 20)
                        .padding()
                }
                
                // Wi-Fi
                if building.wifi {
                    Image(systemName: "wifi")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width:20, height: 20)
                        .padding()
                } else {
                    Image(systemName: "wifi.slash")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width:20, height: 20)
                        .padding()
                }
                
                // Favourite
                Button(action: {
                    DataManager.shared.toggleFavorite(for: building.symbol)
                })
                {
                    if let favorite = building.favorite {
                        if favorite {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width:20, height: 20)
                                .padding()
                        }
                        else {
                            Image(systemName: "heart")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width:20, height: 20)
                                .padding()
                        }
                    }
                    else{
                        Image(systemName: "heart")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width:20, height: 20)
                            .padding()
                    }
                }
            }
            .font(.caption)
        }
        .padding()
    }
    
}

struct BuildingCardView_Previews: PreviewProvider {
    static var example_building = DataManager.shared.getData()[0]
    static var previews: some View {
        BuildingCardView(building: example_building)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
