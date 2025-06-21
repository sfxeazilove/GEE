import SwiftUI
import Combine

struct Chat: Identifiable {
    let id = UUID()
    let user: User
    let lastMessage: ChatMessage?
    let unreadCount: Int
   
    var timeString: String {
        guard let lastMessage = lastMessage else { return "" }
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: lastMessage.timestamp)
    }
}
