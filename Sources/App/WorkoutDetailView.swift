import SwiftUI

struct WorkoutDetailView: View {
    let workout: WorkoutPackage
    @State private var isWorkoutActive = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header Banner
                ZStack(alignment: .bottomLeading) {
                    Rectangle()
                        .fill(workout.color.gradient)
                        .frame(height: 200)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(workout.title)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text(workout.subtitle)
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding()
                }
                
                // Info section
                HStack {
                    InfoCard(title: "Süre", value: "\(workout.durationInMinutes) dk", icon: "timer")
                    InfoCard(title: "Zorluk", value: workout.difficulty.rawValue, icon: "flame")
                    InfoCard(title: "Bölge", value: workout.targetArea, icon: "figure.arms.open")
                }
                .padding(.horizontal)
                
                // Exercises List
                VStack(alignment: .leading, spacing: 16) {
                    Text("Hareketler")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    ForEach(workout.exercises) { exercise in
                        ExerciseRow(exercise: exercise)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
                
                // Start Button
                Button(action: {
                    isWorkoutActive = true
                }) {
                    Text("Antrenmana Başla")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(workout.color)
                        .cornerRadius(12)
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(Theme.background)
        .fullScreenCover(isPresented: $isWorkoutActive) {
            ActiveWorkoutView(workout: workout)
        }
    }
}

struct InfoCard: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(Theme.accent)
            
            Text(value)
                .font(.headline)
                .foregroundColor(Theme.primaryText)
            
            Text(title)
                .font(.caption)
                .foregroundColor(Theme.secondaryText)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Theme.secondaryBackground)
        .cornerRadius(12)
    }
}

struct ExerciseRow: View {
    let exercise: Exercise
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Theme.secondaryBackground)
                    .frame(width: 50, height: 50)
                
                Image(systemName: exercise.systemImageName)
                    .font(.title3)
                    .foregroundColor(Theme.accent)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(exercise.name)
                    .font(.headline)
                    .foregroundColor(Theme.primaryText)
                
                Text(exercise.description)
                    .font(.caption)
                    .foregroundColor(Theme.secondaryText)
                    .lineLimit(2)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                if let sets = exercise.sets, let reps = exercise.repetitions {
                    Text("\(sets)x\(reps)")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(Theme.primaryText)
                } else if let duration = exercise.durationInSeconds {
                    Text("\(duration)sn")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(Theme.primaryText)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}