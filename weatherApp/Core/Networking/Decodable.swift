import Foundation
extension Decodable {
    static func decode<T: Codable>(_ data: Data) -> Result<T> {
        if let decoded = try? JSONDecoder().decode(T.self, from: data) {
            return .value(decoded)
        }
      return .error(.badServerResponse)
    }
}
