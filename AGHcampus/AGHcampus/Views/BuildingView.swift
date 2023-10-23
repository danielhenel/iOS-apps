import SwiftUI

struct BuildingView: View {
    let building: Building

    var body: some View {
        ScrollView {
            VStack {
                // Building Image
                building.buildingImage
                    .resizable()
                    .frame(width: 400, height: 200)
                // Symbol
                Text(building.symbol)
                    .font(.title)
                    .padding()
                // Official Name
                if let name = building.officialName {
                    Text(name)
                        .font(.title)
                        .padding()
                }
                // Address
                Text(building.address)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()

                // Description
                Text(building.buildingDescription)
                    .padding()

                // Accessibility for wheel chairs
                if building.accessibilityForWheelchairs == .limited {
                    Image("accessibility")
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
                    Image(systemName: "wifi")
                        .foregroundColor(.gray)
                        .frame(width:20, height: 20)
                        .padding()
                } else {
                    Image(systemName: "wifi.slash")
                        .foregroundColor(.black)
                        .frame(width:20, height: 20)
                        .padding()
                }

                // Favourite
                if building.favourite {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.gray)
                        .frame(width:20, height: 20)
                        .padding()
                } else {
                    Image(systemName: "heart")
                        .foregroundColor(.black)
                        .frame(width:20, height: 20)
                        .padding()
                }

                // Map
                Image(building.buildingImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding()
            }
        }
    }
}

struct BuildingView_Previews: PreviewProvider {
    tatic var example_building = BuildingData.buildings[0]
    var previews: some View {
        BuildingView(building: example_building)
    }
}