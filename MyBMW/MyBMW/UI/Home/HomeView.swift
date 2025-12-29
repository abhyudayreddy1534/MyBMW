import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var nav: NavCoordinator
    @Environment(\.listCornerRadius) private var cornerRadius
    
    let x3List = [
        "Alpine White",
        "Carbon Black Metallic",
        "Black Sapphire Metallic_",
        "Phytonic Blue Metallic",
        "Brooklyn Grey Metallic",
        "Tanzanite Blue II Metallic",
        "Aventurin Red Metallic",
        "Sao Paulo Yellow",
        "Jet Black",
        "Skyscraper Grey metallic"
    ]
    
    var body: some View {
        ARNList(
            style: .plain
        ) {
            ZStack(alignment: .bottom) {
                Image("home_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .ignoresSafeArea(edges: .top)
                
                LinearGradient(
                    colors: [
                        .clear,
                        Color.black.opacity(0.4),
                        Color.black.opacity(0.8)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
                
                Image("2024-BMW-X3-Color-Phytonic Blue Metallic")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 12)
            }
            .frame(height: 300)
            
            vehicleStatusView
            
            ARNListItem(
                icon: .car,
                title: Constants.Home.vehicleFinder,
                description: Constants.Home.vehicleAddress,
                accessory: .textButton(
                    "Map",
                    action: {
                        print(
                            "Map button action"
                        )
                    })
            ) {
            }
            ARNSection(
                Constants.Home.myTrips,
                subtitle: Constants.Home.myTripsDesc
            ) {
                //TODO: Trip section in progress
            }
            ARNGroupedSectionCard(
                Constants.Home.vehicleControlCenter,
                rows: [
                    ARNRow(
                        icon: .carSide,
                        title: Constants.Home.vehicleInfo
                    ) {
                        nav.homePath.append(
                            HomeRoute.vehicleDetail(
                                id: "v1"
                            )
                        )
                    },
                    ARNRow(
                        icon: .settings,
                        title: Constants.Home.vehicleConfig
                    ) {
                        nav.homePath.append(
                            HomeRoute.tripHistory
                        )
                    },
                    ARNRow(
                        icon: .globe,
                        title: Constants.Home.upgradeForVehicle,
                        description: Constants.Home.upgradeForVehicleDesc,
                        accessory: .iconButton(
                            .link,
                            action: {
                                //TODO: Custom handler here.
                            })
                    ) {
                        nav.homePath.append(
                            HomeRoute.tripHistory
                        )
                    }
                ]
            )
            ARNGroupedSectionCard(
                Constants.Home.dealerServices,
                rows: [
                    ARNRow(
                        icon: .carWithGearBadge,
                        title: Constants.Home.dealerLocation
                    ) {
                        nav.homePath.append(
                            HomeRoute.vehicleDetail(
                                id: "v1"
                            )
                        )
                    },
                    ARNRow(
                        icon: .carService,
                        title: Constants.Home.scheduleService
                    ) {
                        nav.homePath.append(
                            HomeRoute.tripHistory
                        )
                    },
                    ARNRow(
                        icon: .search,
                        title: Constants.Home.findAnotherDealer
                    ) {
                        nav.homePath.append(
                            HomeRoute.tripHistory
                        )
                    }
                ]
            )
            ARNListItem(
                title: Constants.Home.roadSideAssistance
            ) {
                //TODO: This should be a button
            }
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
//        .toolbarBackground(.hidden, for: .navigationBar)
//        .toolbarColorScheme(.dark, for: .navigationBar)
    }
    
    @ViewBuilder
    private var vehicleStatusView: some View {
        VStack(spacing: 12) {
            HStack(spacing: 16) {
                statusIcon(ARNIcon.lock.rawValue)
                Spacer()
                statusIcon(ARNIcon.unlock.rawValue)
                Spacer()
                statusIcon(ARNIcon.headLight.rawValue)
                Spacer()
                statusIcon(ARNIcon.horn.rawValue)
                Spacer()
                statusIcon(ARNIcon.fan.rawValue)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 14)
            .padding(.top, 12)
            
            ARNDivider(leadingInset: -40)
                .padding(.leading, 14)
            ARNListItem(
                rowStyle: .flat,
                title: Constants.Home.remoteServices,
                accessory: .icon(.chevronUp)
            ) {
            }
            .padding(.horizontal, 14)
            ARNTileGrid(
                tiles: [
                    ARNTile(
                        title: Constants.Home.remoteServices_tile_1_title,
                        subtitle: Constants.Home.remoteServices_tile_1_desc,
                        icon: .fanClimate,
                        accessory: ARNListItemAccessory.none
                    ) {
                        // action
                    },
                    ARNTile(
                        title: Constants.Home.remoteServices_tile_2_title,
                        subtitle: Constants.Home.remoteServices_tile_2_desc,
                        icon: .remoteCamera,
                        accessory: .none
                    ) {
                        // action
                    }
                ],
                spacing: 10
            )
            .padding(.horizontal, 14)
            .padding(.bottom, 12)
        }
        .background(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(ARNColor.backgroundGray)
        )
    }
    
    @ViewBuilder
    private func statusIcon(_ systemName: String) -> some View {
        Image(systemName: systemName)
            .font(.system(size: 24, weight: .regular))
            .foregroundStyle(ARNColor.textPrimary)
            .frame(width: 32, height: 32)
    }
}

#Preview {
    HomeView()
}
