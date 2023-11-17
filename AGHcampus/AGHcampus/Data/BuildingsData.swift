
import Foundation
import SwiftUI
import MapKit

struct Building {
    let symbol: String
    let name: String?
    let wifi: Bool
    let wheelchair: AccessibilityStatus
    let floors: Int
    let street: String
    let houseNumber: String
    let postcode: String
    let city: String
    let description: String
    let type: String
    let polygon: [Coordinate]
    let imageURL: String?
    let favorite: Bool?
    
    enum AccessibilityStatus: String, Codable {
        case limited
        case yes
        case no
    }
    
    struct Coordinate: Codable {
        let lat: Double
        let lon: Double
    }
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case name
        case wifi
        case wheelchair
        case floors
        case street
        case houseNumber
        case postcode
        case city
        case description
        case type
        case polygon
        case imageURL
        case favorite
    }
}

extension Building: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(symbol, forKey: .symbol)
        try container.encode(name, forKey: .name)
        try container.encode(wifi, forKey: .wifi)
        try container.encode(wheelchair, forKey: .wheelchair)
        try container.encode(floors, forKey: .floors)
        try container.encode(street, forKey: .street)
        try container.encode(houseNumber, forKey: .houseNumber)
        try container.encode(postcode, forKey: .postcode)
        try container.encode(city, forKey: .city)
        try container.encode(description, forKey: .description)
        try container.encode(type, forKey: .type)
        try container.encode(polygon, forKey: .polygon)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(imageURL, forKey: .favorite)
    }
}

extension Building: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        symbol = try values.decode(String.self, forKey: .symbol)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        wifi = try values.decode(Bool.self, forKey: .wifi)
        wheelchair = try values.decode(AccessibilityStatus.self, forKey: .wheelchair)
        floors = try values.decode(Int.self, forKey: .floors)
        street = try values.decode(String.self, forKey: .street)
        houseNumber = try values.decode(String.self, forKey: .houseNumber)
        postcode = try values.decode(String.self, forKey: .postcode)
        city = try values.decode(String.self, forKey: .city)
        description = try values.decode(String.self, forKey: .description)
        type = try values.decode(String.self, forKey: .type)
        polygon = try values.decode([Coordinate].self, forKey: .polygon)
        imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
        favorite = try values.decodeIfPresent(Bool.self, forKey: .favorite)
    }
}


class DataManager {
    static let shared = DataManager()
    
    private var data: [Building] = []
    
    private init() {
        loadData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveData), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    func getData() -> [Building] {
        return data
    }
    
    @objc private func saveData() {
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(data)
            
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let archiveURL = documentsDirectory.appendingPathComponent("data.json")
                try jsonData.write(to: archiveURL, options: .noFileProtection)
            }
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
    
    private func loadData() {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let archiveURL = documentsDirectory.appendingPathComponent("data.json")
            
            if FileManager.default.fileExists(atPath: archiveURL.path) {
                do {
                    let jsonData = try Data(contentsOf: archiveURL)
                    let decoder = JSONDecoder()
                    data = try decoder.decode([Building].self, from: jsonData)
                    return
                } catch {
                    print("Error loading data from file: \(error.localizedDescription)")
                }
            }
        }
        fetchDataFromAPI()
    }
    
    private func fetchDataFromAPI() {
        guard let url = URL(string: "https://tools.sokoloowski.pl/pum-api/") else {
            print("Invalid API URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self, let data = data, error == nil else {
                print("Error fetching data from API: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                self.data = try decoder.decode([Building].self, from: data)
                self.saveData()
            } catch {
                print("Error decoding data from API: \(error)")
            }
        }.resume()
    }
}

struct BuildingData{
    static let shared = BuildingData()
    
    static let dataManager = DataManager.shared
    static let buildings = dataManager.getData()
}

