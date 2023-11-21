import SwiftUI
import MapKit

struct BuildingWrapper: Identifiable { // Custom wrapper conforming to Identifiable
    let building: Building // Your original Building type
    var id: String { building.symbol } // Use a unique property as the identifier
    
    // Other properties or initializers if needed
}

struct MapViewWithUserLocation: UIViewRepresentable {
//    @Binding var shouldTrackUser: Bool
    var buildings: [Building] = SourceOfTruth.shared.buildings// Dodana lista budynków

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        
        // Dodanie znaczników dla wszystkich budynków na mapie
        for building in buildings {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: building.polygon[0].lat, longitude: building.polygon[0].lon)
            annotation.title = building.symbol
            mapView.addAnnotation(annotation)
        }
        
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        if SourceOfTruth.shared.shouldTrackUser {
            mapView.setUserTrackingMode(.follow, animated: true)
        } else {
            mapView.setUserTrackingMode(.none, animated: true)
            let centerCoordinate = CLLocationCoordinate2D(latitude: 50.065854, longitude: 19.914745) // Współrzędne AGH
            let region = MKCoordinateRegion(center: centerCoordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewWithUserLocation

        init(_ parent: MapViewWithUserLocation) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }

            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "customAnnotation")
            
            if let title = annotation.title, let building = parent.buildings.first(where: { $0.symbol == title }) {
                annotationView.markerTintColor = UIColor(BuildingTheme.backgroundColor(buildingType: building.type))
                if building.favorite == true {
                    annotationView.glyphTintColor = .green // Dodatkowa zmiana koloru dla ulubionego budynku
                }
                annotationView.displayPriority = .required
            }

            return annotationView
        }
    }
}


struct MapViewWithUserLocation_Previews: PreviewProvider {
    static var previews: some View {
        return MapViewWithUserLocation()
    }
}

