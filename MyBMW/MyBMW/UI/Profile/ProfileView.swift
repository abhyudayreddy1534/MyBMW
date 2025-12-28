import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var nav: NavCoordinator

    var body: some View {
        ARNList {
            //Tiles here
            ARNTileGrid(
                tiles: [
                    ARNTile(title: "Account data",
                            icon: .profile,
                            accessory: .none) {},
                    ARNTile(title: "Settings",
                            icon: .settings,
                            accessory: .none) {}
                ],
                spacing: 10
            )
            ARNSection(
                "Featured App themes",
                subtitle: "Themes can be selected from the catalog and you will get to experience the intuitive view of your BMW"
            ) {
                
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
            
            ARNSection("3rd party services") {
                ARNListItem(
                    rowStyle: .flat,
                    icon: .alexa,
                    title: "Amazon Alexa",
                    description: "Configure Alexa for your BMW"
                ) {
                    //TODO: action here
                    nav.explorePath.append(ExploreRoute.charging)
                }
                
                ARNListItem(
                    rowStyle: .flat,
                    icon: .sim,
                    title: "Personal eSIM",
                    description: "Hotspot, Telephone"
                ) {
                    //TODO: action here
                    nav.explorePath.append(ExploreRoute.charging)
                }
            }
            
            ARNSection("Feedback") {
                ARNListItem(
                    rowStyle: .flat,
                    icon: .feedback,
                    title: "App Feedback",
                    description: "Submit your feedback about the My BMW App",
                    accessory: .textButton("Share", action: {
                        //TODO: Chat action here
                        nav.explorePath.append(ExploreRoute.charging)
                    })
                ) {
                    //TODO: action here
                    nav.explorePath.append(ExploreRoute.charging)
                }
            }
            
            ARNSection("Data management") {
                ARNListItem(
                    rowStyle: .flat,
                    icon: .privacy,
                    title: "Privacy & Terms",
                ) {
                    //TODO: action here
                    nav.explorePath.append(ExploreRoute.charging)
                }
            }
        }
        .navigationTitle("Profile")
    }
}
