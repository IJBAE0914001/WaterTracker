import Foundation

extension UserDefaults {
    func save<T: Codable>(_ value: T, key: String) {
        if let encoded = try? JSONEncoder().encode(value) {
            self.set(encoded, forKey: key)
        }
    }

    func load<T: Codable>(key: String) -> T? {
        if let data = self.data(forKey: key),
           let decoded = try? JSONDecoder().decode(T.self, from: data) {
            return decoded
        }
        return nil
    }
}
