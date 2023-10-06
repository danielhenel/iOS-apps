import SwiftUI

struct BuildingView: View {
    let buildingImage: Image? // Zdjęcie budynku
    let buildingSymbol: String? // Symbol budynku
    let officialName: String // Oficjalna nazwa budynku
    let address: String // Adres budynku
    let buildingDescription: String // Charakterystyka budynku
    let isAccessibleForWheelchairs: AccessibilityStatus // Dostępność dla wózków inwalidzkich

    var body: some View {
        ScrollView {
            VStack {
                if let image = buildingImage {
                    image
                        .resizable()
                        .frame(width: 400, height: 200)
                }
                Text(officialName)
                    .font(.title)
                    .padding()
                if let name = buildingSymbol {
                    Text(name)
                        .font(.title)
                        .padding()
                }
                Text(address)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
                Text(buildingDescription)
                    .padding()
                if isAccessibleForWheelchairs == .limited {
                    Image("Image 2")
                        .foregroundColor(.gray)
                        .frame(width:20, height: 20)
                        .padding()
                } else if isAccessibleForWheelchairs == .yes {
                    Image(systemName: "figure.roll")
                        .foregroundColor(.black)
                        .frame(width:20, height: 20)
                        .padding()
                }
                // Mapa budynku (wstępnie statyczny obrazek)
                Image("Image 3")
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
        BuildingView(buildingImage: Image("Image 1"),
                     buildingSymbol: nil,
                     officialName: "Basen AGH",
                     address: "Jana Buszka 4, 30-150 Kraków",
                     buildingDescription: "Basen AGH to miejsce rekreacji i sportu znajdujące się na terenie Akademii Górniczo-Hutniczej w Krakowie. ",
                     isAccessibleForWheelchairs: .yes)
    }
}

struct ContentView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
