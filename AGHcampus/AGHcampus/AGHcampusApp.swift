import SwiftUI

@main
struct AGHcampusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
       
        WindowGroup {
           ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        
    }
}


