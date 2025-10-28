import Foundation
import Combine

class WaterTrackerViewModel: ObservableObject {
    @Published var settings: AppSettings = UserDefaults.standard.load(key: "settings") ?? AppSettings()
    @Published var records: [IntakeRecord] = UserDefaults.standard.load(key: "records") ?? []
    
    var todayIntake: Int {
        records.filter { Calendar.current.isDateInToday($0.date) }
               .map { $0.amount }.reduce(0, +)
    }

    var progress: Double {
        Double(todayIntake) / Double(settings.dailyGoal)
    }

    func add(amount: Int) {
        let record = IntakeRecord(amount: amount)
        records.append(record)
        saveRecords()
    }

    func resetToday() {
        records.removeAll { Calendar.current.isDateInToday($0.date) }
        saveRecords()
    }

    func saveSettings() {
        UserDefaults.standard.save(settings, key: "settings")
    }

    func saveRecords() {
        UserDefaults.standard.save(records, key: "records")
    }
}
