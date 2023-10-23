struct SourceOfTruth {

    static var favourites: [String: Bool] = [:]
    static var buildings: [Building] = BuildingData.buildings

    static func initSharedAttributes() {
        for building in buildings{
            favourites[building.symbol] = false;
        }
    }
}
