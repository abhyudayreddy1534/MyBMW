import SwiftUI

struct RootTabView: View {
    @StateObject private var nav = NavCoordinator()
    /** Tab Bar
    case carTabBar = "car"
    case mapTabBar = "map"
    case exploreTabBar = "lightbulb.max"
    case servicesTabBar = "tray.full"
    case profileTabBar = "person"
    */
    var body: some View {
        TabView(selection: $nav.selectedTab) {
            HomeNavView()
                .tag(AppTab.home)
                .tabItem { Label("Home", systemImage: "car") }

            MapNavView()
                .tag(AppTab.map)
                .tabItem { Label("Map", systemImage: "map") }

            ExploreNavView()
                .tag(AppTab.explore)
                .tabItem { Label("Explore", systemImage: "lightbulb.max") }
            
            ServicesNavView()
                .tag(AppTab.services)
                .tabItem { Label("Services", systemImage: "tray.full") }

            ProfileNavView()
                .tag(AppTab.profile)
                .tabItem { Label("Profile", systemImage: "person") }
        }
        .environmentObject(nav)
    }
}
