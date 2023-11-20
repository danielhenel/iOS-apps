import SwiftUI

class SourceOfTruth: ObservableObject {
    static let shared = SourceOfTruth()
    @Published var buildings: [Building] = DataManager.shared.getData()
}
