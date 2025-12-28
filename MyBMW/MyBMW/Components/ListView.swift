//
//  ARNList.swift
//  MyBMW
//
//  Created by Sravanthi Chinthireddy on 27/12/25.
//

import SwiftUI

// MARK: - ARNList (Custom list container)

struct ARNList<Content: View>: View {
    enum Style {
        case plain
        case groupedInset
        case transparent
    }

    let style: Style
    let spacing: CGFloat
    let contentPadding: CGFloat
    let cornerRadius: CGFloat
    let content: Content

    init(
        style: Style = .plain,
        spacing: CGFloat = 10,
        contentPadding: CGFloat = 12,
        cornerRadius: CGFloat = 18,
        @ViewBuilder content: () -> Content
    ) {
        self.style = style
        self.spacing = spacing
        self.contentPadding = contentPadding
        self.cornerRadius = cornerRadius
        self.content = content()
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: spacing) {
                content
            }
            .padding(contentPadding)
            .padding(.bottom, 90) // room for custom tab bar
        }
        .background(background.ignoresSafeArea())
        .environment(\.listCornerRadius, cornerRadius)
    }

    @ViewBuilder
    private var background: some View {
        switch style {
        case .plain:
            // Adaptive gradient for light/dark
            LinearGradient(
                colors: [ARNColor.background, ARNColor.surface],
                startPoint: .top,
                endPoint: .bottom
            )

        case .groupedInset:
            ARNColor.groupedBackground

        case .transparent:
            Color.clear
        }
    }
}

// MARK: - Environment Key for corner radius

private struct ARNListCornerRadiusKey: EnvironmentKey {
    static let defaultValue: CGFloat = 8
}

extension EnvironmentValues {
    var listCornerRadius: CGFloat {
        get { self[ARNListCornerRadiusKey.self] }
        set { self[ARNListCornerRadiusKey.self] = newValue }
    }
}

// MARK: - ARNSection (Header at section level)

struct ARNSection<Content: View>: View {
    let title: String?
    let subtitle: String?
    let content: Content

    init(
        _ title: String? = nil,
        subtitle: String? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.subtitle = subtitle
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            header
            content
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                if let title = title {
                    Text(title.uppercased())
                        .frame(alignment: .leading)
                        .font(ARNTextStyle.headline)
                        .foregroundStyle(ARNColor.textPrimary)
                    Spacer()
                }
            }

            if let subtitle, !subtitle.isEmpty {
                Text(subtitle)
                    .font(ARNTextStyle.footnote)
                    .foregroundStyle(ARNColor.textSecondary)
            }
        }
        .padding(.horizontal, 2)
    }
}

// MARK: - ARNGroupedSectionCard (header INSIDE rounded card + auto dividers)

struct ARNGroupedSectionCard: View {
    let title: String
    let subtitle: String?
    let rows: [ARNRow]?
    let image: String?
    
    let imageHeight: CGFloat = 150.0
    
    var shouldUseLightText : Bool {
        if image != nil {
            true
        } else {
            false
        }
    }

    @Environment(\.listCornerRadius) private var cornerRadius

    init(_ title: String, subtitle: String? = nil, image: String? = nil, rows: [ARNRow]? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.rows = rows
        self.image = image
    }

    var body: some View {
        VStack(spacing: 0) {
            headerWithBackground
            
            if let rows = rows, !rows.isEmpty {
                ForEach(Array(rows.enumerated()), id: \.element.id) { idx, row in
                    ARNListItem(
                        rowStyle: .flat, // ✅ flat row (no rounded background/border)
                        icon: row.icon,
                        title: row.title,
                        description: row.description,
                        footerImage: row.footerImage,
                        accessory: row.accessory,
                        onTap: row.onTap
                    )
                    
                    if idx < rows.count - 1 {
                        ARNDivider() // indented between rows
                    }
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(ARNColor.backgroundGray)
        )
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(ARNColor.border.opacity(0.6), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
    
    private var headerWithBackground: some View {
        Group {
            if let image = image {
                ZStack (alignment: .bottom) {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: imageHeight)
                        .frame(maxWidth: .infinity)
                        .clipped()
                    
                    LinearGradient(
                        colors: [
                            .clear,
                            Color.black.opacity(0.4),
                            Color.black.opacity(0.8)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: imageHeight)
                    
                    HStack {
                        header
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(ARNColor.textPrimaryDark)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 12)
                }
                .frame(height: imageHeight)
            } else {
                header
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title.uppercased())
                .font(ARNTextStyle.headline)
                .foregroundStyle(shouldUseLightText ? ARNColor.textPrimaryDark : ARNColor.textPrimary)

            if let subtitle, !subtitle.isEmpty {
                Text(subtitle)
                    .font(ARNTextStyle.footnote)
                    .foregroundStyle(shouldUseLightText ? ARNColor.textPrimaryDark : ARNColor.textPrimary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
