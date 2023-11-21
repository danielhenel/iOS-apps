import SwiftUI

struct ContentView: View {
    @ObservedObject var sourceOfTruth = SourceOfTruth.shared
    var body: some View {
        TabView {
            BuildingsListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Buildings List")
                }
                .tag(0)
            
            VStack{
                MapViewWithUserLocation()
                Button(action: {
                    sourceOfTruth.shouldTrackUser.toggle()
                            }) {
                                Text(sourceOfTruth.shouldTrackUser ? "Stop Tracking" : "Track User Location")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
            }
                .tabItem {
                    Image(systemName: "map")
                    Text("Map View")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
