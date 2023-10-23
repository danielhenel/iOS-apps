import SwiftUI

@main
struct AGHcampusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        SourceOfTruth.initSharedAttributes()
        WindowGroup {
            BuildingsListView(buildings: BuildingData.buildings)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
