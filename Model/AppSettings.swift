import Foundation

struct AppSettings: Codable {
    var dailyGoal: Int = 2000
    var notificationsEnabled: Bool = false
    var notificationInterval: Int = 60
    var themeSetting: Int = 0 // 0: system, 1: light, 2: dark
}
