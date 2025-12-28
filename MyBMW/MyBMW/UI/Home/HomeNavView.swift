import SwiftUI

struct HomeNavView: View {
    @EnvironmentObject private var nav: NavCoordinator

    var body: some View {
        NavigationStack(path: $nav.homePath) {
            HomeView()
                .navigationDestination(for: HomeRoute.self) { route in
                    switch route {
                    case .vehicleDetail(let id):
                        Text("Vehicle Detail \(id)")
                    case .tripHistory:
                        Text("Trip History")
                    }
                }
        }
    }
}