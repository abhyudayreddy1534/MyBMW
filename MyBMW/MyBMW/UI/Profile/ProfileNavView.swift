import SwiftUI

struct ProfileNavView: View {
    @EnvironmentObject private var nav: NavCoordinator

    var body: some View {
        NavigationStack(path: $nav.profilePath) {
            ProfileView()
                .navigationDestination(for: ProfileRoute.self) { _ in
                    Text("Account")
                }
        }
    }
}