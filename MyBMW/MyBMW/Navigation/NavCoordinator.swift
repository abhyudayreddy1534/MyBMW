import SwiftUI
internal import Combine

enum AppTab: Hashable {
    case home, explore, map, services, profile
}

enum HomeRoute: Hashable {
    case vehicleDetail(id: String)
    case tripHistory
}

enum ExploreRoute: Hashable {
    case remoteCommands
    case charging
    case settings
}

enum MapRoute: Hashable {
    case destinationSearch
}

enum ServicesRoute: Hashable {
    case appointments
}

enum ProfileRoute: Hashable {
    case account
}

@MainActor
final class NavCoordinator: ObservableObject {
    @Published var selectedTab: AppTab = .home
    @Published var homePath = NavigationPath()
    @Published var explorePath = NavigationPath()
    @Published var mapPath = NavigationPath()
    @Published var servicesPath = NavigationPath()
    @Published var profilePath = NavigationPath()
}
