import SwiftUI
import MapKit

struct BuildingMapView: UIViewRepresentable {
    let building: Building
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Create MKPolygon from building's coordinates
        let coordinates = building.polygon.map { CLLocationCoordinate2D(latitude: $0.lat, longitude: $0.lon) }
        let buildingPolygon = MKPolygon(coordinates: coordinates, count: coordinates.count)
        mapView.addOverlay(buildingPolygon)
        
        // Zoom to the building area
        if let firstCoordinate = coordinates.first {
            let region = MKCoordinateRegion(center: firstCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
            mapView.setRegion(region, animated: true)
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update the view if needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polygon = overlay as? MKPolygon {
                let renderer = MKPolygonRenderer(polygon: polygon)
                renderer.fillColor = UIColor.blue.withAlphaComponent(0.3)
                renderer.strokeColor = UIColor.blue
                renderer.lineWidth = 1
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
}
