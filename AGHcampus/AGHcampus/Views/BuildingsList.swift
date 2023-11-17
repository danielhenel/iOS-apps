import Foundation

import SwiftUI

struct BuildingTheme {
    static func backgroundColor(buildingType: String) -> SwiftUI.Color {
        // The background color should depend on the type of the building
        if buildingType == "university" {
            return SwiftUI.Color.red
        } else if buildingType == "dormitory" {
            return SwiftUI.Color.green
        } else if buildingType == "hotel" {
            return SwiftUI.Color.white
        } else if buildingType == "library" {
            return SwiftUI.Color.orange
        } else if buildingType == "sports_centre" {
            return SwiftUI.Color.brown
        } else if buildingType == "college" {
            return SwiftUI.Color.gray
        } else { //Other
            return SwiftUI.Color.yellow
        }
    }
}

struct BuildingsListView: View {
    let buildings: [Building]
    var body: some View {
//        ScrollView {
            NavigationStack {
                List(buildings, id: \.symbol) { building in
                    NavigationLink(destination:
                    BuildingView(building: building)){
                    BuildingCardView(building: building)
                    }
                    
                    .listRowBackground(BuildingTheme.backgroundColor(buildingType: building.type))
                }
                .navigationTitle("AGH Campus")
                .toolbar {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("New Building")
                }
            }
//        }
    }
}

struct BuildingsListView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingsListView(buildings: BuildingData.buildings)
    }
}
