import Foundation

import SwiftUI

struct BuildingTheme {
//    static func backgroundColor(buildingType: Building.BuildingType) -> SwiftUI.Color {
//        // The background color should depend on the type of the building
//        if buildingType == Building.BuildingType.auditorium {
//            return SwiftUI.Color.red
//        } else if buildingType == Building.BuildingType.student_dormitory {
//            return SwiftUI.Color.green
//        } else if buildingType == Building.BuildingType.office {
//            return SwiftUI.Color.white
//        } else if buildingType == Building.BuildingType.laboratory {
//            return SwiftUI.Color.orange
//        } else if buildingType == Building.BuildingType.library {
//            return SwiftUI.Color.brown
//        } else if buildingType == Building.BuildingType.sport_object {
//            return SwiftUI.Color.gray
//        } else { //Other
//            return SwiftUI.Color.yellow
//        }
//    }
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
                    
//                    .listRowBackground(BuildingTheme.backgroundColor(buildingType: building.type))
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
