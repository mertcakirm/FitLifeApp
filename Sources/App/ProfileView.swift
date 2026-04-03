import SwiftUI
import Charts

struct ProfileView: View {
    @State private var isDarkModeEnabled = false
    @State private var weight: String = "75"
    @State private var height: String = "180"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Haftalık Aktivite (Dakika)")) {
                    Chart {
                        ForEach(MockData.weeklyActivity) { item in
                            BarMark(
                                x: .value("Gün", item.day),
                                y: .value("Dakika", item.minutes)
                            )
                            .foregroundStyle(Theme.accent.gradient)
                            .cornerRadius(4)
                        }
                    }
                    .frame(height: 200)
                    .padding(.vertical)
                }
                
                Section(header: Text("Kişisel Bilgiler")) {
                    HStack {
                        Text("Kilo (kg)")
                        Spacer()
                        TextField("Kilo", text: $weight)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("Boy (cm)")
                        Spacer()
                        TextField("Boy", text: $height)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                }
                
                Section(header: Text("Tercihler")) {
                    Toggle("Bildirimler", isOn: .constant(true))
                        .tint(Theme.accent)
                }
                
                Section {
                    Button(action: {
                        // Sign out logic
                    }) {
                        Text("Çıkış Yap")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Profil")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}