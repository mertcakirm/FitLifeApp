import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            WorkoutListView()
                .tabItem {
                    Label("Antrenman", systemImage: "figure.run.square.stack")
                }
            
            DietListView()
                .tabItem {
                    Label("Diyet", systemImage: "fork.knife")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.crop.circle")
                }
        }
        .tint(Theme.accent)
    }
}

// Preview provider for canvas
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}