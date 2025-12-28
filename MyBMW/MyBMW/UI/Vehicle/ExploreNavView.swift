import SwiftUI

struct ExploreNavView: View {
    @EnvironmentObject private var nav: NavCoordinator

    var body: some View {
        NavigationStack(path: $nav.explorePath) {
            ExploreView()
                .navigationDestination(for: ExploreRoute.self) { route in
                    switch route {
                    case .remoteCommands:
                        Text("Remote Commands")
                    case .charging:
                        Text("Charging")
                    case .settings:
                        Text("Vehicle Settings")
                    }
                }
        }
    }
}
