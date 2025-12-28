import SwiftUI

struct ServicesNavView: View {
    @EnvironmentObject private var nav: NavCoordinator

    var body: some View {
        NavigationStack(path: $nav.servicesPath) {
            ServicesView()
                .navigationDestination(for: ServicesRoute.self) { _ in
                    Text("Appointments")
                }
        }
    }
}