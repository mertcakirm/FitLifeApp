import SwiftUI

struct WorkoutListView: View {
    let workouts = MockData.workouts
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(workouts) { workout in
                        NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                            WorkoutCardView(workout: workout)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("Antrenman Paketleri")
            .background(Theme.background)
        }
        .navigationViewStyle(.stack)
    }
}

struct WorkoutCardView: View {
    let workout: WorkoutPackage
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(workout.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(workout.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(2)
                
                HStack(spacing: 12) {
                    Label("\(workout.durationInMinutes) dk", systemImage: "clock")
                        .font(.caption)
                    
                    Label(workout.difficulty.rawValue, systemImage: "flame.fill")
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
                .fill(workout.color.gradient)
        )
        .shadow(color: workout.color.opacity(0.3), radius: 8, x: 0, y: 4)
    }
}

struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListView()
    }
}