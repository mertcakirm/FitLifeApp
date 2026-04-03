import Foundation
import SwiftUI

// MARK: - Workout Models

struct Exercise: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let durationInSeconds: Int?
    let repetitions: Int?
    let sets: Int?
    let systemImageName: String
}

struct WorkoutPackage: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let difficulty: Difficulty
    let targetArea: String
    let durationInMinutes: Int
    let exercises: [Exercise]
    let color: Color
    
    enum Difficulty: String, CaseIterable, Hashable {
        case beginner = "Başlangıç"
        case intermediate = "Orta"
        case advanced = "İleri"
    }
}

// MARK: - Diet Models

struct Meal: Identifiable, Hashable {
    let id = UUID()
    let type: MealType
    let name: String
    let description: String
    let calories: Int
    let protein: Int
    let carbs: Int
    let fat: Int
    
    enum MealType: String, Hashable {
        case breakfast = "Kahvaltı"
        case lunch = "Öğle Yemeği"
        case dinner = "Akşam Yemeği"
        case snack = "Ara Öğün"
    }
}

struct DietPlan: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let goal: String
    let dailyCalories: Int
    let meals: [Meal]
    let color: Color
}

// MARK: - Activity Models

struct ActivityData: Identifiable {
    let id = UUID()
    let day: String
    let minutes: Int
}

// MARK: - Mock Data

struct MockData {
    static let workouts: [WorkoutPackage] = [
        WorkoutPackage(
            title: "Tam Vücut Başlangıç",
            subtitle: "Spor salonuna yeni başlayanlar için ideal",
            difficulty: .beginner,
            targetArea: "Tüm Vücut",
            durationInMinutes: 30,
            exercises: [
                Exercise(name: "Isınma (Hafif Koşu)", description: "Vücut sıcaklığını artırır.", durationInSeconds: 300, repetitions: nil, sets: 1, systemImageName: "figure.run"),
                Exercise(name: "Squat (Vücut Ağırlığı)", description: "Bacak ve kalça kaslarını çalıştırır.", durationInSeconds: nil, repetitions: 15, sets: 3, systemImageName: "figure.strengthtraining.traditional"),
                Exercise(name: "Şınav (Diz Üstü)", description: "Göğüs, omuz ve arka kol kaslarını çalıştırır.", durationInSeconds: nil, repetitions: 10, sets: 3, systemImageName: "figure.core.training"),
                Exercise(name: "Mekik", description: "Karın kaslarını çalıştırır.", durationInSeconds: nil, repetitions: 15, sets: 3, systemImageName: "figure.yoga")
            ],
            color: .blue
        ),
        WorkoutPackage(
            title: "Hipertrofi: Üst Vücut",
            subtitle: "Kas kütlesini artırmak için tasarlanmış yoğun antrenman",
            difficulty: .intermediate,
            targetArea: "Üst Vücut",
            durationInMinutes: 45,
            exercises: [
                Exercise(name: "Bench Press", description: "Göğüs kasları odaklı.", durationInSeconds: nil, repetitions: 10, sets: 4, systemImageName: "dumbbell"),
                Exercise(name: "Lat Pulldown", description: "Sırt kasları odaklı.", durationInSeconds: nil, repetitions: 12, sets: 4, systemImageName: "figure.strengthtraining.functional"),
                Exercise(name: "Dumbbell Shoulder Press", description: "Omuz kasları odaklı.", durationInSeconds: nil, repetitions: 10, sets: 3, systemImageName: "figure.mixed.cardio")
            ],
            color: .orange
        ),
        WorkoutPackage(
            title: "Kardiyo Yanığı",
            subtitle: "Maksimum kalori yakımı için yüksek yoğunluklu kardiyo",
            difficulty: .advanced,
            targetArea: "Kardiyovasküler",
            durationInMinutes: 20,
            exercises: [
                Exercise(name: "Burpees", description: "Tüm vücut kardiyo hareketi.", durationInSeconds: 60, repetitions: nil, sets: 4, systemImageName: "figure.highintensity.intervaltraining"),
                Exercise(name: "Mountain Climbers", description: "Karın ve kardiyo.", durationInSeconds: 45, repetitions: nil, sets: 4, systemImageName: "figure.core.training")
            ],
            color: .red
        ),
        WorkoutPackage(
            title: "Karın Kası Odaklı (Core)",
            subtitle: "Güçlü bir merkez bölgesi için kısa ve etkili hareketler",
            difficulty: .intermediate,
            targetArea: "Karın ve Merkez",
            durationInMinutes: 15,
            exercises: [
                Exercise(name: "Plank", description: "Merkez bölgesini sabit tutma.", durationInSeconds: 60, repetitions: nil, sets: 3, systemImageName: "figure.core.training"),
                Exercise(name: "Russian Twist", description: "Yan karın kaslarını çalıştırır.", durationInSeconds: nil, repetitions: 20, sets: 3, systemImageName: "figure.yoga"),
                Exercise(name: "Leg Raises", description: "Alt karın kasları odaklı.", durationInSeconds: nil, repetitions: 15, sets: 3, systemImageName: "figure.pilates")
            ],
            color: .teal
        ),
        WorkoutPackage(
            title: "Evde Pilates ve Esneme",
            subtitle: "Esneklik kazanmak ve rahatlamak için",
            difficulty: .beginner,
            targetArea: "Tüm Vücut / Esneklik",
            durationInMinutes: 30,
            exercises: [
                Exercise(name: "Cat-Cow Stretch", description: "Omurga esnekliğini artırır.", durationInSeconds: 60, repetitions: nil, sets: 2, systemImageName: "figure.yoga"),
                Exercise(name: "Child's Pose", description: "Sırt ve omuzları rahatlatır.", durationInSeconds: 60, repetitions: nil, sets: 2, systemImageName: "figure.mind.and.body"),
                Exercise(name: "Glute Bridge", description: "Kalça kaslarını aktive eder.", durationInSeconds: nil, repetitions: 15, sets: 3, systemImageName: "figure.pilates")
            ],
            color: .pink
        )
    ]
    
    static let dietPlans: [DietPlan] = [
        DietPlan(
            title: "Kilo Verme (Definasyon)",
            description: "Kalori açığı oluşturarak yağ yakımını hedefler.",
            goal: "Yağ Yakımı",
            dailyCalories: 1800,
            meals: [
                Meal(type: .breakfast, name: "Yulaf Ezmesi", description: "Süt, yulaf, çilek ve tarçın.", calories: 350, protein: 12, carbs: 55, fat: 8),
                Meal(type: .snack, name: "Badem ve Elma", description: "1 avuç çiğ badem ve 1 adet yeşil elma.", calories: 200, protein: 5, carbs: 20, fat: 12),
                Meal(type: .lunch, name: "Izgara Tavuk Salata", description: "Zeytinyağlı, bol yeşillikli tavuk göğsü salatası.", calories: 450, protein: 45, carbs: 15, fat: 20),
                Meal(type: .dinner, name: "Izgara Balık ve Kuşkonmaz", description: "Somon veya levrek, fırınlanmış kuşkonmaz ile.", calories: 550, protein: 40, carbs: 10, fat: 35)
            ],
            color: .green
        ),
        DietPlan(
            title: "Kas Kazanımı (Bulking)",
            description: "Kalori fazlası ve yüksek protein ile kas kütlesi inşası.",
            goal: "Kas Gelişimi",
            dailyCalories: 2800,
            meals: [
                Meal(type: .breakfast, name: "Yumurtalı Tam Buğday Tost", description: "3 yumurta, 2 dilim tam buğday ekmeği, avokado.", calories: 600, protein: 30, carbs: 45, fat: 35),
                Meal(type: .lunch, name: "Pirinçli Tavuk", description: "Beyaz pirinç ve soslu tavuk göğsü.", calories: 750, protein: 55, carbs: 100, fat: 10),
                Meal(type: .snack, name: "Protein Shake", description: "Protein tozu, muz ve fıstık ezmesi.", calories: 450, protein: 35, carbs: 40, fat: 15),
                Meal(type: .dinner, name: "Biftek ve Tatlı Patates", description: "Izgara dana biftek ve fırın tatlı patates.", calories: 800, protein: 60, carbs: 65, fat: 30)
            ],
            color: .purple
        ),
        DietPlan(
            title: "Aralıklı Oruç (16/8)",
            description: "16 saat açlık, 8 saat yeme penceresi. Sağlıklı kilo yönetimi.",
            goal: "Kilo Kontrolü",
            dailyCalories: 2000,
            meals: [
                Meal(type: .lunch, name: "İlk Öğün: Avokadolu Yumurta", description: "Tam buğday ekmeği üzerinde avokado ve haşlanmış yumurta.", calories: 500, protein: 25, carbs: 30, fat: 35),
                Meal(type: .snack, name: "Ara Öğün: Kuruyemiş ve Meyve", description: "Ceviz ve 1 porsiyon taze meyve.", calories: 300, protein: 8, carbs: 35, fat: 18),
                Meal(type: .dinner, name: "Son Öğün: Izgara Et ve Sebze", description: "Izgara köfte veya tavuk, bol fırın sebze.", calories: 700, protein: 50, carbs: 45, fat: 30)
            ],
            color: .mint
        ),
        DietPlan(
            title: "Vegan Güç",
            description: "Bitkisel bazlı proteinlerle dolu, enerjik hissettiren diyet.",
            goal: "Bitkisel Beslenme",
            dailyCalories: 2200,
            meals: [
                Meal(type: .breakfast, name: "Tofu Scramble", description: "Ezilmiş tofu, zerdeçal, ıspanak ve domates.", calories: 400, protein: 25, carbs: 15, fat: 22),
                Meal(type: .lunch, name: "Nohutlu Kinoa Salatası", description: "Kinoa, haşlanmış nohut, yeşillikler ve limon sosu.", calories: 550, protein: 20, carbs: 70, fat: 15),
                Meal(type: .snack, name: "Fıstık Ezmeli Elma", description: "Dilimlenmiş elma ve şekersiz fıstık ezmesi.", calories: 250, protein: 8, carbs: 25, fat: 14),
                Meal(type: .dinner, name: "Mercimek Köftesi", description: "Kırmızı mercimek, ince bulgur ve bol yeşillik.", calories: 600, protein: 25, carbs: 80, fat: 10)
            ],
            color: .cyan
        )
    ]
    
    static let weeklyActivity: [ActivityData] = [
        ActivityData(day: "Pzt", minutes: 30),
        ActivityData(day: "Sal", minutes: 45),
        ActivityData(day: "Çar", minutes: 20),
        ActivityData(day: "Per", minutes: 0),
        ActivityData(day: "Cum", minutes: 60),
        ActivityData(day: "Cmt", minutes: 15),
        ActivityData(day: "Paz", minutes: 30)
    ]
}