import SwiftUI

struct Theme {
    static let primaryBackground = Color("PrimaryBackground") // Fallback to standard if missing
    static let cardBackground = Color("CardBackground")
    static let primaryText = Color.primary
    static let secondaryText = Color.secondary
    static let accent = Color.accentColor
    
    // Using native dynamic colors for immediate light/dark mode support without asset catalogs
    static let background = Color(UIColor.systemBackground)
    static let secondaryBackground = Color(UIColor.secondarySystemBackground)
    static let tertiaryBackground = Color(UIColor.tertiarySystemBackground)
    
    // Semantic colors
    static let success = Color.green
    static let warning = Color.orange
    static let danger = Color.red
}