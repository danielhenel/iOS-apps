import SwiftUI

class SourceOfTruth: ObservableObject {
    static let shared = SourceOfTruth()
    @Published var buildings: [Building] = DataManager.shared.getData()
    @State var showingAlert: Bool = false
    @Published var shouldTrackUser: Bool = false
}
