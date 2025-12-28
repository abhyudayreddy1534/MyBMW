import SwiftUI

struct ServicesView: View {
    @EnvironmentObject private var nav: NavCoordinator

    var body: some View {
        ARNList {
//            ARNListItem(
//                title: "Connected Drive upgrades".uppercased(),
//                description: "Manage and enable digital features and connectivity services of your BMW."
//            ) {
//                //TODO: image with title component should be here
//                nav.servicesPath.append(ServicesRoute.appointments)
//            }
//            
            ARNGroupedSectionCard(
                "Connected Drive upgrades",
                subtitle: "Manage and enable digital features and connectivity services of your BMW.",
                image: "drive",
                rows: [
                    ARNRow(
                        title: "",
                        description: "All available infotainment, and innovative operating functions for your vehicle have been activated.",
                        accessory: .custom(view: AnyView(EmptyView()), action: {
                            //TODO: get an empty icon
                        }),
                        onTap: {
                            //TODO: Action here
                            nav.servicesPath.append(ServicesRoute.appointments)
                        })
                ]
                )
            
            ARNGroupedSectionCard(
                "Service and maintenance",
                subtitle: "Manage the service requirements of your BMW and find authorised service centres.",
                image: "service",
                rows: [
                    ARNRow(
                        icon: .carService,
                        title: "Schedule Service",
                        description: "Book a service with your preferred service centre",
                        accessory: .textButton("start", action: {
                            //TODO: Action here
                        }),
                        onTap: {
                        //TODO: Action here
                    }),
                    ARNRow(
                        icon: .carWithGearBadge,
                        title: "Preferred service centre",
                        description: "BMW of Grapevine",
                        accessory: .textButton("map", action: {
                            //TODO: Action here
                        }),
                        onTap: {
                        //TODO: Action here
                    }),
                    ARNRow(
                        icon: .more,
                        title: "More...",
                        onTap: {
                        //TODO: Action here
                    })
                ])
            
            ARNGroupedSectionCard(
                "Financial services",
                subtitle: "Self serve your agreements",
                image: "finance"
                )
            
            ARNSection() {
                ARNTileGrid(
                    tiles: [
                        ARNTile(title: "BMW Online shop".uppercased(),
                                subtitle: "Shop Accessories and Lifestyle products",
                                icon: .globe,
                                accessory: .iconButton(.link, action: {
                                    
                                })) {
                                },
                        ARNTile(title: "Warranty and Preventive maintenance".uppercased(),
                                subtitle: nil,
                                icon: .globe,
                                accessory: .iconButton(.link, action: {
                                })) {
                                }
                    ],
                    spacing: 10
                )
            }
            
            ARNGroupedSectionCard(
                "Find your new BMW",
                subtitle: "Explore models and find your new BMW.",
                rows: [
                    ARNRow(
                        icon: .configure,
                        title: "Configure my new BMW",
                        description: "Build my perfect BMW in only a few clicks",
                        accessory: .icon(.link),
                        onTap: {
                        //TODO: Action here
                    }),
                    ARNRow(
                        icon: .stock,
                        title: "Stock Locator",
                        description: "Search for new BMW vehicles that are available",
                        accessory: .icon(.link),
                        onTap: {
                        //TODO: Action here
                    }),
                    ARNRow(
                        icon: .steeringWheel,
                        title: "Book a test drive",
                        description: "Get behind the wheel of a brand new BMW",
                        footerImage: "carFooter",
                        accessory: .icon(.link),
                        onTap: {
                        //TODO: Action here
                    })
                ])
        }
        .navigationTitle("BMW Services & Store")
    }
}
