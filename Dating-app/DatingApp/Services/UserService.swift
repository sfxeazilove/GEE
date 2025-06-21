import SwiftUI
import Combine

protocol UserServiceProtocol {
    func fetchPendingUsers() -> AnyPublisher<[User], Never>
    func fetchChats() -> AnyPublisher<[Chat], Never>
}

class UserService: UserServiceProtocol {
    func fetchPendingUsers() -> AnyPublisher<[User], Never> {
        let users = [
            User(name: "Amanda", age: 22, bio: "is out of your music preferences", profileImageURL: nil, isOnline: false),
            User(name: "Malti", age: 31, bio: "is out of your music preferences", profileImageURL: nil, isOnline: true)
        ]
        return Just(users).eraseToAnyPublisher()
    }
   
    func fetchChats() -> AnyPublisher<[Chat], Never> {
        let users = [
            User(name: "Jessica", age: 25, bio: nil, profileImageURL: nil, isOnline: true),
            User(name: "Amanda", age: 22, bio: nil, profileImageURL: nil, isOnline: false),
            User(name: "You", age: 28, bio: nil, profileImageURL: nil, isOnline: false),
            User(name: "Malti", age: 31, bio: nil, profileImageURL: nil, isOnline: true)
        ]
       
        let messages = [
            ChatMessage(userId: users[1].id, content: "but i your house music too", timestamp: Calendar.current.date(byAdding: .hour, value: -2, to: Date()) ?? Date(), isRead: true),
            ChatMessage(userId: users[2].id, content: "omg i love hip compres send to ty you are cool", timestamp: Calendar.current.date(byAdding: .hour, value: -1, to: Date()) ?? Date(), isRead: true),
            ChatMessage(userId: users[3].id, content: "Hahaha that's interesting, it does seem like they are dating", timestamp: Date(), isRead: false)
        ]
       
        let chats = [
            Chat(user: users[0], lastMessage: nil, unreadCount: 1),
            Chat(user: users[1], lastMessage: messages[0], unreadCount: 0),
            Chat(user: users[2], lastMessage: messages[1], unreadCount: 0),
            Chat(user: users[3], lastMessage: messages[2], unreadCount: 1)
        ]
       
        return Just(chats).eraseToAnyPublisher()
    }
}
