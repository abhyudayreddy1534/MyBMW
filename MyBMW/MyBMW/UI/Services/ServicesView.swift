import SwiftUI

struct ServicesView: View {
    @EnvironmentObject private var nav: NavCoordinator

    var body: some View {
        ARNList {
            ServicesHeader()
                .padding(.horizontal, -20)
            
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
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ServicesHeader: View {
    let height: CGFloat = 220
    let bgHeight: CGFloat = 150
    let bottomClearHeight: CGFloat = 70

    var body: some View {
        ZStack(alignment: .bottom) {

            // Base: BG image + bottom clear block (combined)
            VStack(spacing: 0) {
                ZStack(alignment: .leading) {
                    Image("service_bg")
                        .resizable()
                        .scaledToFill()
                        .frame(height: bgHeight)
                        .frame(maxWidth: .infinity)
                        .clipped()

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Hey Abhyuday !")
                            .foregroundStyle(ARNColor.textPrimaryWhite)
                            .font(.system(size: 16, weight: .bold))

                        Text("ALL\nSERVICES")
                            .foregroundStyle(ARNColor.textPrimaryWhite)
                            .font(.system(size: 40, weight: .bold))
                            .lineSpacing(-2)
                    }
                    .padding(.leading, 16)
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                Color.clear
                    .frame(height: bottomClearHeight)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .clipped()

            // Gradient on top of entire header
            LinearGradient(
                colors: [
                    .clear,
                    Color.black.opacity(0.35),
                    Color.black.opacity(0.75)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .allowsHitTesting(false)

            // Car image anchored to bottom-right
            Image("2024-BMW-X3-Color-Phytonic Blue Metallic")
                .resizable()
                .scaledToFit()
                .frame(height: 140)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, -70)
                .padding(.bottom, 8)
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .ignoresSafeArea(edges: .top)
    }
}
