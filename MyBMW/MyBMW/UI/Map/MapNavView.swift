import SwiftUI

struct MapNavView: View {
    @EnvironmentObject private var nav: NavCoordinator

    var body: some View {
        NavigationStack(path: $nav.mapPath) {
            MapView()
                .navigationDestination(for: MapRoute.self) { _ in
                    Text("Destination Search")
                }
        }
    }
}