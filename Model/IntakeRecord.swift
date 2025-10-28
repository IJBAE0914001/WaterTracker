import Foundation

struct IntakeRecord: Identifiable, Codable {
    var id = UUID()
    var amount: Int
    var date: Date = Date()
}
