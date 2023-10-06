import SwiftUI

struct BuildingView: View {
    let buildingImage: Image? // Zdjęcie budynku
    let buildingSymbol: String // Symbol budynku
    let officialName: String? // Oficjalna nazwa budynku
    let address: String // Adres budynku
    let buildingDescription: String // Charakterystyka budynku
    let isAccessibleForWheelchairs: AccessibilityStatus // Dostępność dla wózków inwalidzkich

    var body: some View {
        ScrollView {
            VStack {
                if let image = buildingImage {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                }
                Text(buildingSymbol)
                    .font(.title)
                    .padding()
                if let name = officialName {
                    Text(name)
                        .font(.headline)
                        .padding()
                }
                Text(address)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
                Text(buildingDescription)
                    .padding()
                if isAccessibleForWheelchairs == .limited {
                    Image(systemName: "wheelchair")
                        .foregroundColor(.gray)
                        .padding()
                } else if isAccessibleForWheelchairs == .yes {
                    Image(systemName: "wheelchair")
                        .foregroundColor(.black)
                        .padding()
                }
                // Mapa budynku (wstępnie statyczny obrazek)
                Image("building_map")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding()
            }
        }
        .navigationTitle("BuildingView")
    }
}

// Enum reprezentujący dostępność dla wózków inwalidzkich
enum AccessibilityStatus {
    case limited
    case yes
}

struct BuildingView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingView(buildingImage: Image("building_image"),
                     buildingSymbol: "Budynek C-2",
                     officialName: "Dom Studencki Olimp",
                     address: "Mickiewicza 30",
                     buildingDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget lectus eu augue eleifend pharetra.",
                     isAccessibleForWheelchairs: .yes)
    }
}

struct ContentView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
