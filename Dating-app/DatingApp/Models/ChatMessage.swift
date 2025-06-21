import SwiftUI
import Combine

struct ChatMessage: Identifiable, Codable {
    var id = UUID()
    let userId: UUID
    let content: String
    let timestamp: Date
    let isRead: Bool
}

