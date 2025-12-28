//
//  ListView.swift
//  MyBMW
//
//  Created by Sravanthi Chinthireddy on 27/12/25.
//
import SwiftUI

enum ARNListItemAccessory {
    /// Default chevron (non-interactive)
    case chevron
    
    /// none (no icon)
    case none

    /// An icon on the right (non-interactive)
    case icon(ARNIcon)

    /// A tappable icon button
    case iconButton(ARNIcon, action: () -> Void)

    /// A tappable text button (pill style)
    case textButton(String, action: () -> Void)

    /// Any custom view + action
    case custom(view: AnyView, action: (() -> Void)? = nil)
}

struct ARNListItem: View {
    
    let rowStyle: RowStyle
    let leftIcon: ARNIcon?
    let title: String
    let description: String?
    let accessory: ARNListItemAccessory
    let footerImage: String?
    let onTap: () -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.listCornerRadius) private var cornerRadius
    
    init(rowStyle: RowStyle = .card,
         icon: ARNIcon? = nil,
         title: String,
         description: String? = nil,
         footerImage: String? = nil,
         accessory: ARNListItemAccessory = .chevron,
         onTap: @escaping () -> Void) {
        self.rowStyle = rowStyle
        self.leftIcon = icon
        self.title = title
        self.description = description
        self.accessory = accessory
        self.onTap = onTap
        self.footerImage = footerImage
    }
    
    var body: some View {
        let row = HStack(spacing: 12) {
            if let leftIcon {
                VStack {
                    leftIcon.image()
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.textPrimary)
                        .frame(width: 24, height: 24, alignment: .centerFirstTextBaseline)
                    Spacer()
                }
            }
            VStack(alignment: .leading, spacing: 4) {
                if !title.isEmpty {
                    Text(title)
                        .font(ARNTextStyle.body)
                        .foregroundStyle(.textPrimary)
                }
                
                if let description, !description.isEmpty {
                    Text(description)
                        .font(ARNTextStyle.footnote)
                        .foregroundStyle(.textSecondary)
                        .lineLimit(2)
                }
                if let footerImage = footerImage {
                    Image(footerImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .clipped()
                }
            }
            Spacer(minLength: 10)

            VStack {
                accessoryView
                Spacer()
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(background)
        .overlay(border)
        .contentShape(Rectangle())
        .onTapGesture(perform: onTap)
        
        return row
    }
    
    @ViewBuilder
    private var accessoryView: some View {
        switch accessory {
        case .chevron:
            ARNIcon.chevronRight.image()
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(ARNColor.textSecondary)
        case .none:
            EmptyView()
        case .icon(let icon):
            icon.image()
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(ARNColor.textSecondary)

        case .iconButton(let icon, let action):
            Button(action: action) {
                icon.image()
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(ARNColor.textSecondary)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
//                    .background(Capsule().fill(ARNColor.textPrimary.opacity(0.06)))
            }
            .buttonStyle(.plain)

        case .textButton(let text, let action):
            Button(action: action) {
                Text(text.uppercased())
                    .font(ARNTextStyle.footnoteStrong)
                    .foregroundStyle(ARNColor.accent)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
//                    .background(Capsule().stroke(ARNColor.textSecondary.opacity(0.06), lineWidth: 0.5))
            }
            .buttonStyle(.plain)

        case .custom(let view, let action):
            if let action {
                Button(action: action) { view }
                    .buttonStyle(.plain)
            } else {
                view
            }
        }
    }

    // MARK: Styling

    @ViewBuilder
    private var background: some View {
        switch rowStyle {
        case .card:
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(ARNColor.backgroundGray)

        case .flat:
            Color.clear
        }
    }

    private var border: some View {
        Group {
            if rowStyle == .card {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(ARNColor.border.opacity(colorScheme == .dark ? 0.55 : 0.70), lineWidth: 1)
            }
        }
    }
}

// MARK: - ARNRow (model so grouped sections can auto-add separators)

struct ARNRow: Identifiable {
    let id = UUID()
    let icon: ARNIcon?
    let title: String
    let description: String?
    let accessory: ARNListItemAccessory
    let footerImage: String?
    let onTap: () -> Void

    init(
        icon: ARNIcon? = nil,
        title: String,
        description: String? = nil,
        footerImage: String? = nil,
        accessory: ARNListItemAccessory = .chevron,
        onTap: @escaping () -> Void
    ) {
        self.icon = icon
        self.title = title
        self.description = description
        self.accessory = accessory
        self.onTap = onTap
        self.footerImage = footerImage
    }
}

// MARK: - ARNDivider (auto separator, indented by default)

struct ARNDivider: View {
    /// Default aligns after left icon column:
    /// left padding (14) + icon width (28) + spacing (12) = 54
    var leadingInset: CGFloat = 14 + 28 + 12

    var body: some View {
        Rectangle()
            .fill(ARNColor.border.opacity(0.55))
            .frame(height: 1 / UIScreen.main.scale)
            .padding(.leading, leadingInset)
    }
}

extension ARNListItem {
    enum RowStyle { case card, flat }
}
