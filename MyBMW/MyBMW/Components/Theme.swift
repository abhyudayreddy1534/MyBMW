//
//  Theme.swift
//  MyBMW
//
//  Created by Sravanthi Chinthireddy on 27/12/25.
//

import SwiftUI

enum ARNColor {
    // MARK: Text (semantic)

    static var textPrimary: Color { Color(uiColor: .label) }
    static var textSecondary: Color { Color(uiColor: .secondaryLabel) }
    static var textTertiary: Color { Color(uiColor: .tertiaryLabel) }
    static var textPrimaryDark: Color { Color(uiColor: .lightText) }
    static var textPrimaryWhite: Color { Color(uiColor: .white) }

    // MARK: Background / Surfaces / Borders
    static var background: Color { Color(uiColor: .systemBackground) }
    static var groupedBackground: Color { Color(uiColor: .systemGroupedBackground) }
    static var surface: Color { Color(uiColor: .secondarySystemBackground) }
    static var backgroundGray: Color { Color(white: 0.9, opacity: 0.2) }
    static var border: Color { Color(uiColor: .separator) }

    // MARK: Accents

    static var accent: Color { Color(uiColor: .systemBlue) }
    static var destructive: Color { Color(uiColor: .systemRed) }
    static var bmwBlue: Color { Color(UIColor(red: 26.0/255.0, green: 46/255.0, blue: 75/255.0, alpha: 1)) }
}

enum ARNTextStyle {
    static let title = Font.title2.weight(.semibold)
    static let headline = Font.headline.weight(.semibold)
    static let body = Font.body.weight(.regular)
    static let footnote = Font.footnote
    static let footnoteStrong = Font.footnote.weight(.semibold)
    static let caption = Font.caption.weight(.semibold)
}

extension ShapeStyle where Self == Color {
    static var textPrimary: Color { ARNColor.textPrimary }
    static var textSecondary: Color { ARNColor.textSecondary }
    static var textTertiary: Color { ARNColor.textTertiary }
    static var backgroundGray: Color { ARNColor.backgroundGray }
    static var appBorder: Color { ARNColor.border }
}
