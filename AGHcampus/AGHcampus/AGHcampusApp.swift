import SwiftUI

@main
struct AGHcampusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
       
        WindowGroup {
            BuildingsListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        
    }
}


