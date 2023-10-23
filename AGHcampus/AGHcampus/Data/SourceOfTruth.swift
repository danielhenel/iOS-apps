struct SourceOfTruth {

    var favourites: [String: Bool] = [:]

    static func initSharedAttributes(buildings: [Building]) {
        for building in buildings{
            building.favourite = false;
            favourites[building.symbol] = false;
        }
    }
}