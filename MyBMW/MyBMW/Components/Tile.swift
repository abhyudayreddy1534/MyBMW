//
//  Tile.swift
//  MyBMW
//
//  Created by Sravanthi Chinthireddy on 28/12/25.
//

import SwiftUI

struct ARNTile: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String?
    let icon: ARNIcon?
    var accessory: ARNListItemAccessory = .none
    let action: () -> Void
    
    init(
        title: String,
        subtitle: String? = nil,
        icon: ARNIcon? = nil,
        accessory: ARNListItemAccessory,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.accessory = accessory
        self.action = action
    }
}

struct ARNTileView: View {
    let tile: ARNTile
    @Environment(\.listCornerRadius) private var cornerRadius

    var body: some View {
        Button(action: tile.action) {
            VStack(alignment: .leading, spacing: 6) {
                if let icon = tile.icon {
                    icon.image()
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(ARNColor.textSecondary)
                        .frame(width: 28, height: 28)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 3) {
                    Text(tile.title)
                        .font(ARNTextStyle.body)
                        .foregroundStyle(ARNColor.textPrimary)

                    if let subtitle = tile.subtitle, !subtitle.isEmpty {
                        Text(subtitle)
                            .font(ARNTextStyle.footnote)
                            .foregroundStyle(ARNColor.textSecondary)
                            .lineLimit(3)
                    }
                }
                HStack {
                    Spacer()
                    accessoryView
                }
            }
            .padding(14)
            .frame(maxWidth: .infinity, minHeight: 84, alignment: .leading)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(ARNColor.backgroundGray)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(ARNColor.border.opacity(0.6), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
    
    @ViewBuilder
    private var accessoryView: some View {
        switch tile.accessory {
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
}

struct ARNTileGrid: View {
    let tiles: [ARNTile]
    var spacing: CGFloat = 10

    var body: some View {
        let rows = tiles.chunked(into: 2)

        return VStack(spacing: spacing) {
            ForEach(rows.indices, id: \.self) { i in
                let row = rows[i]
                HStack(spacing: spacing) {
                    ARNTileView(tile: row[0])

                    if row.count == 2 {
                        ARNTileView(tile: row[1])
                    }
                }
            }
        }
    }
}

///This is to make sure I have max 2 tiles in a row and if it's left with 1 tile at the bottom, it will auto adjust the full width.
///This won't be possible if I use SwiftUI Grid component
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        guard size > 0 else { return [] }
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
