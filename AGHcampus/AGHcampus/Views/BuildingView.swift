import SwiftUI
import MapKit

struct BuildingView: View {
    let building: Building
    var body: some View {
            VStack {
                // Building Image
                AsyncImage(url: URL(string: building.imageURL ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 400, height: 200)
                    case .failure:
                        Text("NO IMAGE")
                    @unknown default:
                        EmptyView()
                    }}
                
                // Symbol
                Text(building.symbol)
                    .font(.title)
                    .padding(EdgeInsets(top: 2, leading: 12, bottom: 8, trailing: 12))
                
                // Official Name
                if let name = building.name {
                    Text(name)
                        .font(.title)
                }
                
                // Address
                Text(building.street + building.houseNumber + building.city)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
                ScrollView{
                    // Description
                    Text(building.description)
                    .padding()}.frame(maxHeight: 200)
                HStack{
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

                // Map
                BuildingMapView(building: building)
            }
            .padding(10)
    }
}

struct BuildingView_Previews: PreviewProvider {
    static var example_building = DataManager.shared.getData()[0]
    static var previews: some View {
        BuildingView(building: example_building)
    }
}
