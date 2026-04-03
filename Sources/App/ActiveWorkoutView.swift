import SwiftUI

struct ActiveWorkoutView: View {
    let workout: WorkoutPackage
    @Environment(\.dismiss) var dismiss
    
    @State private var currentExerciseIndex = 0
    @State private var timeRemaining = 0
    @State private var timerActive = false
    @State private var workoutFinished = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var currentExercise: Exercise? {
        if currentExerciseIndex < workout.exercises.count {
            return workout.exercises[currentExerciseIndex]
        }
        return nil
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if workoutFinished {
                    workoutCompleteView
                } else if let exercise = currentExercise {
                    exerciseView(for: exercise)
                }
            }
            .navigationTitle(workout.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Kapat") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                setupExercise()
            }
            .onReceive(timer) { _ in
                if timerActive && timeRemaining > 0 {
                    timeRemaining -= 1
                } else if timerActive && timeRemaining == 0 {
                    timerActive = false
                }
            }
        }
    }
    
    private func setupExercise() {
        guard let exercise = currentExercise else { return }
        if let duration = exercise.durationInSeconds {
            timeRemaining = duration
            timerActive = false // Wait for user to start
        } else {
            timeRemaining = 0
            timerActive = false
        }
    }
    
    private func nextExercise() {
        if currentExerciseIndex < workout.exercises.count - 1 {
            currentExerciseIndex += 1
            setupExercise()
        } else {
            workoutFinished = true
        }
    }
    
    private var workoutCompleteView: some View {
        VStack(spacing: 24) {
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(Theme.success)
            
            Text("Antrenman Tamamlandı!")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            Text("Harika bir iş çıkardın. Dinlenmeyi unutma.")
                .font(.body)
                .foregroundColor(Theme.secondaryText)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: {
                dismiss()
            }) {
                Text("Bitir")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Theme.accent)
                    .cornerRadius(12)
            }
            .padding(.top, 40)
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func exerciseView(for exercise: Exercise) -> some View {
        VStack(spacing: 30) {
            Spacer()
            
            ZStack {
                Circle()
                    .fill(workout.color.opacity(0.1))
                    .frame(width: 150, height: 150)
                
                Image(systemName: exercise.systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(workout.color)
            }
            
            VStack(spacing: 8) {
                Text(exercise.name)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Text(exercise.description)
                    .font(.body)
                    .foregroundColor(Theme.secondaryText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            // Timer or Reps Display
            if exercise.durationInSeconds != nil {
                VStack(spacing: 16) {
                    Text(timeString(from: timeRemaining))
                        .font(.system(size: 64, weight: .bold, design: .monospaced))
                        .foregroundColor(timeRemaining == 0 ? Theme.success : Theme.primaryText)
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            timerActive.toggle()
                        }) {
                            Image(systemName: timerActive ? "pause.circle.fill" : "play.circle.fill")
                                .resizable()
                                .frame(width: 64, height: 64)
                                .foregroundColor(workout.color)
                        }
                        
                        Button(action: {
                            setupExercise()
                        }) {
                            Image(systemName: "arrow.counterclockwise.circle.fill")
                                .resizable()
                                .frame(width: 44, height: 44)
                                .foregroundColor(Theme.secondaryText)
                        }
                    }
                }
            } else if let sets = exercise.sets, let reps = exercise.repetitions {
                VStack(spacing: 8) {
                    Text("Hedef")
                        .font(.headline)
                        .foregroundColor(Theme.secondaryText)
                    
                    Text("\(sets) Set x \(reps) Tekrar")
                        .font(.largeTitle)
                        .bold()
                }
            }
            
            Spacer()
            
            Button(action: {
                nextExercise()
            }) {
                Text(currentExerciseIndex == workout.exercises.count - 1 ? "Antrenmanı Bitir" : "Sıradaki Hareket")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(workout.color)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
    
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}
