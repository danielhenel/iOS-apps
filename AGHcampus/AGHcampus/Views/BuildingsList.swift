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
    @ObservedObject var sourceOfTruth = SourceOfTruth.shared
    @State private var isShowingAlert = false // Dodaj @State

    var body: some View {
        NavigationView {
            NavigationStack {
                List(sourceOfTruth.buildings, id: \.symbol) { building in
                    NavigationLink(destination: BuildingView(building: building)) {
                        BuildingCardView(building: building)
                    }
                    .listRowBackground(BuildingTheme.backgroundColor(buildingType: building.type))
                }
                .navigationTitle("AGH Campus")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingAlert = true // Ustawienie flagi pokazania alertu
                    }) {
                        Image(systemName: "arrow.clockwise.circle")
                    }
                }
            }
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("Uwaga!"),
                message: Text("Aktualne dane zostaną nadpisane. Czy na pewno chcesz odświeżyć dane?"),
                primaryButton: .destructive(Text("OK")) {
                    DataManager.shared.fetchDataFromAPI()
                    isShowingAlert = false
                },
                secondaryButton: .cancel(Text("Anuluj")) {
                    isShowingAlert = false // Zamknięcie alertu
                }
            )
        }
    }
}





struct BuildingsListView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingsListView()
    }
}
