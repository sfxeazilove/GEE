import SwiftUI
import Combine


struct User: Identifiable, Codable {
    var id = UUID()
    let name: String
    let age: Int
    let bio: String?
    let profileImageURL: String?
    let isOnline: Bool
   
    var displayName: String {
        "\(name), \(age)"
    }
   
    var initials: String {
        String(name.prefix(1))
    }
}
