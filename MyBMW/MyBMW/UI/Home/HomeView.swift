import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var nav: NavCoordinator
    @Environment(\.listCornerRadius) private var cornerRadius
    
    var body: some View {
        ARNList(
            style: .plain
        ) {
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
                "My Trips",
                subtitle: "It looks like you have not taken your vehicle on a trip yet. Come back again after your next trip."
            ) {
                //TODO: Trip section in progress
            }
            ARNGroupedSectionCard(
                "Vehicle Control Center",
                rows: [
                    ARNRow(
                        icon: .carSide,
                        title: "Vehicle Information"
                    ) {
                        nav.homePath.append(
                            HomeRoute.vehicleDetail(
                                id: "v1"
                            )
                        )
                    },
                    ARNRow(
                        icon: .settings,
                        title: "Vehicle configuration"
                    ) {
                        nav.homePath.append(
                            HomeRoute.tripHistory
                        )
                    },
                    ARNRow(
                        icon: .globe,
                        title: "Upgrades for your vehicle",
                        description: "BMW ConnectedDrive Store",
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
                "Dealer Services",
                rows: [
                    ARNRow(
                        icon: .carWithGearBadge,
                        title: "BMW of Grapevine"
                    ) {
                        nav.homePath.append(
                            HomeRoute.vehicleDetail(
                                id: "v1"
                            )
                        )
                    },
                    ARNRow(
                        icon: .carService,
                        title: "Schedule Service"
                    ) {
                        nav.homePath.append(
                            HomeRoute.tripHistory
                        )
                    },
                    ARNRow(
                        icon: .search,
                        title: "Find Another Dealer"
                    ) {
                        nav.homePath.append(
                            HomeRoute.tripHistory
                        )
                    }
                ]
            )
            ARNListItem(
                title: "Accident & roadside assistance".uppercased()
            ) {
                //TODO: This should be a button
            }
        }
        .navigationTitle(
            "Home"
        )
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
                title: "Remote Services",
                accessory: .icon(.chevronUp)
            ) {
            }
            .padding(.horizontal, 14)
            ARNTileGrid(
                tiles: [
                    ARNTile(
                        title: "Plan climate control (engine start)",
                        subtitle: "Set a departure time",
                        icon: .fanClimate,
                        accessory: ARNListItemAccessory.none
                    ) {
                        // action
                    },
                    ARNTile(
                        title: "Remote Camera",
                        subtitle: "Remote 3D View",
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
