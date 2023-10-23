import Foundation

import SwiftUI

struct BuildingTheme {
    static func backgroundColor(buildingType: BuildingType) -> SwiftUI.Color {
        // The background color should depend on the type of the building
        if buildingType == BuildingType.auditorium {
            return SwiftUI.Color.red
        } else if buildingType == BuildingType.student_dormitory {
            return SwiftUI.Color.green
        } else if buildingType == BuildingType.office {
            return SwiftUI.Color.white
        } else if buildingType == BuildingType.labolatory {
            return SwiftUI.Color.orange
        } else if buildingType == BuildingType.library {
            return SwiftUI.Color.brown
        } else if buildingType == BuildingType.sport_object {
            return SwiftUI.Color.gray
        } else { //Other
            return SwiftUI.Color.yellow
        }
    }
}

struct BuildingsListView: View {
    let buildings: [Building]

    var body: some View {
        NavigationStack {
            List(buildings) { building in
                NavigationLink(destination: Text(building.symbol)){
                let cardColor = BuildingTheme.backgroundColor(buildingType: building.type);
                BuildingCardView(building: building)
                }
                .listRowBackground(cardColor)
            }
            .navigationTitle("AGH Campus")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Building")
            }
        }
    }
}

struct BuildingsListView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingsListView(buildings: BuildingData.buildings)
    }
}
