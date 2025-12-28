//
//  Icon.swift
//  MyBMW
//
//  Created by Sravanthi Chinthireddy on 27/12/25.
//

import SwiftUI

/// Central icon definition for the entire app
enum ARNIcon: String, CaseIterable {
    // Navigation
    case chevronRight = "chevron.right"
    
    case chevronUp = "chevron.up"
    case chevronDown = "chevron.down"
    case link = "arrow.up.forward.app"

    // Profile
    case profile = "person.fill"
    case privacy = "shield.lefthalf.filled"
    case alexa = "apple.intelligence"
    case sim = "simcard"
    case feedback = "rectangle.and.pencil.and.ellipsis"

    // Vehicle / Dashboard
    case car = "car"
    case carSide = "car.side"
    case globe = "globe"
    case carWithGearBadge = "car.badge.gearshape"
    case carService = "calendar"
    case search = "magnifyingglass"
    case lock = "lock"
    case unlock = "lock.open"
    case settings = "gearshape"
    case fanClimate = "fan.oscillation"
    case remoteCamera = "camera.on.rectangle"
    case headLight = "headlight.high.beam"
    case horn = "horn"
    case fan = "fan"
    
    //Maps
    case favourite = "star.fill"
    case sent = "car.rear.waves.up"
    case upcoming = "calendar.badge.checkmark"
    
    //Explore
    case chat = "bubble"
    case help = "headphones"

    // Map
    case map = "map.fill"
    case destination = "mappin.and.ellipse"

    // Services
    case service = "wrench.fill"
    case more = "ellipsis.circle"
    case configure = "slider.horizontal.3"//"gearshift.layout.sixspeed"
    case stock = "car.2"
    case steeringWheel = "steeringwheel"

    /// Builds the image (SF Symbol for now)
    func image(
        size: CGFloat = 18,
        weight: Font.Weight = .semibold
    ) -> Image {
        Image(systemName: rawValue)
    }
}
