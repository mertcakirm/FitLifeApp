import SwiftUI

@main
struct FitLifeApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(.none) // Automatically uses system light/dark mode
        }
    }
}