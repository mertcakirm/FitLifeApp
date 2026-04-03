import SwiftUI

struct DietDetailView: View {
    let plan: DietPlan
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header Banner
                ZStack(alignment: .bottomLeading) {
                    Rectangle()
                        .fill(plan.color.gradient)
                        .frame(height: 200)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(plan.title)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text(plan.description)
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding()
                }
                
                // Info section
                HStack {
                    InfoCard(title: "Günlük", value: "\(plan.dailyCalories) kcal", icon: "flame.fill")
                    InfoCard(title: "Hedef", value: plan.goal, icon: "target")
                }
                .padding(.horizontal)
                
                // Meals List
                VStack(alignment: .leading, spacing: 16) {
                    Text("Öğünler")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ForEach(plan.meals) { meal in
                        MealRow(meal: meal)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(Theme.background)
    }
}

struct MealRow: View {
    let meal: Meal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(meal.type.rawValue)
                    .font(.subheadline)
                    .bold()
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Theme.accent.opacity(0.2))
                    .cornerRadius(8)
                    .foregroundColor(Theme.accent)
                
                Spacer()
                
                Text("\(meal.calories) kcal")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(Theme.primaryText)
            }
            
            Text(meal.name)
                .font(.headline)
                .foregroundColor(Theme.primaryText)
            
            Text(meal.description)
                .font(.subheadline)
                .foregroundColor(Theme.secondaryText)
            
            // Macros
            HStack(spacing: 16) {
                MacroView(name: "Protein", value: "\(meal.protein)g", color: .red)
                MacroView(name: "Karb", value: "\(meal.carbs)g", color: .blue)
                MacroView(name: "Yağ", value: "\(meal.fat)g", color: .yellow)
            }
            .padding(.top, 4)
        }
        .padding()
        .background(Theme.secondaryBackground)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct MacroView: View {
    let name: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.caption2)
                .foregroundColor(Theme.secondaryText)
            
            Text(value)
                .font(.caption)
                .bold()
                .foregroundColor(color)
        }
    }
}