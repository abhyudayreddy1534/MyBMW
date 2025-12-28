import SwiftUI

struct MapView: View {
    @EnvironmentObject private var nav: NavCoordinator

    var body: some View {
        ARNList {
            ARNListItem(
                title: "Where is my BMW?",
                description: "4252 Watson Way, North Richland Hills, TX 76180",
                accessory: .icon(.chevronDown)
            ) {
            }
            
            ARNSection(
                "My destinations"
            ) {
                ARNListItem(
                    rowStyle: .flat,
                    icon: .favourite,
                    title: "Favourites"
                ) {
                    nav.mapPath.append(
                        MapRoute.destinationSearch
                    )
                }
                
                ARNListItem(
                    rowStyle: .flat,
                    icon: .sent,
                    title: "Sent"
                ) {
                    nav.mapPath.append(
                        MapRoute.destinationSearch
                    )
                }
                
                ARNListItem(
                    rowStyle: .flat,
                    icon: .upcoming,
                    title: "Upcoming"
                ) {
                    nav.mapPath.append(
                        MapRoute.destinationSearch
                    )
                }
            }
            
            ARNSection(
                "Settings"
            ) {
                ARNListItem(
                    rowStyle: .flat,
                    title: "Route Settings",
                    accessory: .textButton("EDIT", action: {
                        //TODO: Action here
                    })
                ) {
                    nav.mapPath.append(
                        MapRoute.destinationSearch
                    )
                }
                
                ARNListItem(
                    rowStyle: .flat,
                    title: "Calendar Events"
                ) {
                    nav.mapPath.append(
                        MapRoute.destinationSearch
                    )
                }
                
                ARNListItem(
                    rowStyle: .flat,
                    title: "Search history"
                ) {
                    nav.mapPath.append(
                        MapRoute.destinationSearch
                    )
                }
                
                ARNListItem(
                    rowStyle: .flat,
                    title: "Contact search"
                ) {
                    nav.mapPath.append(
                        MapRoute.destinationSearch
                    )
                }
            }
            
        }
        .navigationTitle(
            "Map"
        )
    }
}

#Preview {
    MapView()
}
