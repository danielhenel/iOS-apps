
import Foundation
import SwiftUI
import MapKit

struct Building {
    let symbol: String
    let name: String
    let wifi: Bool
    let wheelchair: AccessibilityStatus
    let floors: Int
    let street: String
    let houseNumber: String
    let postcode: String
    let city: String
    let description: String
    let type: BuildingType
    let polygon: [Coordinate]
    let image: String
    
    enum AccessibilityStatus: String, Codable {
        case limited
        case yes
        case no
    }

    enum BuildingType: String, Codable {
        case auditorium = "Auditorium"
        case student_dormitory = "Student Dormitory"
        case office = "Office"
        case other = "Other"
        case laboratory = "Laboratory"
        case sport_object = "Sport Object"
        case library = "Library"
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
        case image
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
        try container.encode(image, forKey: .image)
    }
}

extension Building: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        symbol = try values.decode(String.self, forKey: .symbol)
        name = try values.decode(String.self, forKey: .name)
        wifi = try values.decode(Bool.self, forKey: .wifi)
        wheelchair = try values.decode(AccessibilityStatus.self, forKey: .wheelchair)
        floors = try values.decode(Int.self, forKey: .floors)
        street = try values.decode(String.self, forKey: .street)
        houseNumber = try values.decode(String.self, forKey: .houseNumber)
        postcode = try values.decode(String.self, forKey: .postcode)
        city = try values.decode(String.self, forKey: .city)
        description = try values.decode(String.self, forKey: .description)
        type = try values.decode(BuildingType.self, forKey: .type)
        polygon = try values.decode([Coordinate].self, forKey: .polygon)
        image = try values.decode(String.self, forKey: .image)
    }
}


import Foundation

class DataManager {
    static let shared = DataManager()
    
    private var data: [Building] = []
    
    private init() {
        loadData()
        
        // Zapisywanie danych w chwili przejścia do stanu nieaktywności
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
        // Sprawdź, czy plik JSON istnieje w lokalnym katalogu dokumentów
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let archiveURL = documentsDirectory.appendingPathComponent("data.json")
            
            if FileManager.default.fileExists(atPath: archiveURL.path) {
                // Jeżeli plik istnieje, odczytaj dane z pliku
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
        
        // Jeżeli plik nie istnieje lub odczyt z pliku zakończył się błędem, pobierz dane z API
        fetchDataFromAPI()
    }
    
    private func fetchDataFromAPI() {
        guard let url = URL(string: "URL_TO_YOUR_API_ENDPOINT") else {
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
                
                // Po pobraniu danych, zapisz je lokalnie
                self.saveData()
            } catch {
                print("Error decoding data from API: \(error.localizedDescription)")
            }
        }.resume()
    }
}

// Użycie DataManager
let dataManager = DataManager.shared
let buildings = dataManager.getData()
// Korzystaj z danych buildings, które mogą pochodzić z pliku lub API

