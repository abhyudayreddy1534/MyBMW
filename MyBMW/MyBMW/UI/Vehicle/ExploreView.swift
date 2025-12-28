import SwiftUI

struct ExploreView: View {
    @EnvironmentObject private var nav: NavCoordinator

    var body: some View {
        ARNList {
            ARNSection("A view of your vehicle") {
                ARNListItem(title: "Your BMW Gallery") {
                    //TODO: action here
                    nav.explorePath.append(ExploreRoute.remoteCommands)
                }
            }
            
            ARNSection("Help & Contact") {
                ARNListItem(
                    icon: .chat,
                    title: "BMW AI Assistant",
                    description: "Instant answers to your questions 24/7",
                    accessory: .textButton("Open Chat", action: {
                        //TODO: Chat action here
                        nav.explorePath.append(ExploreRoute.charging)
                    })
                ) {
                    //TODO: action here
                    nav.explorePath.append(ExploreRoute.charging)
                }
                
                ARNListItem(
                    icon: .help,
                    title: "Help Center",
                    description: "Useful links and more support",
                    accessory: .textButton("Open", action: {
                        //TODO: help action here
                        nav.explorePath.append(ExploreRoute.settings)
                    })
                ) {
                    //TODO: action here
                    nav.explorePath.append(ExploreRoute.settings)
                }
            }
        }
        .navigationTitle("Explore")
    }
}
