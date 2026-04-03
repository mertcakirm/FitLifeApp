import SwiftUI

struct DietListView: View {
    let dietPlans = MockData.dietPlans
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(dietPlans) { plan in
                        NavigationLink(destination: DietDetailView(plan: plan)) {
                            DietCardView(plan: plan)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("Diyet Planları")
            .background(Theme.background)
        }
        .navigationViewStyle(.stack)
    }
}

struct DietCardView: View {
    let plan: DietPlan
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(plan.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(plan.description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(2)
                
                HStack(spacing: 12) {
                    Label("\(plan.dailyCalories) kcal", systemImage: "flame")
                        .font(.caption)
                    
                    Label(plan.goal, systemImage: "target")
                        .font(.caption)
                }
                .foregroundColor(.white)
                .padding(.top, 4)
            }
            .padding()
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .padding(.trailing)
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(plan.color.gradient)
        )
        .shadow(color: plan.color.opacity(0.3), radius: 8, x: 0, y: 4)
    }
}