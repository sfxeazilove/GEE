import SwiftUI
import Combine

class ChatsViewModel: ObservableObject {
    @Published var chats: [Chat] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
   
    private let userService: UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
   
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
        loadChats()
    }
   
    func loadChats() {
        isLoading = true
        errorMessage = nil
       
        userService.fetchChats()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                },
                receiveValue: { [weak self] chats in
                    self?.chats = chats
                }
            )
            .store(in: &cancellables)
    }
   
    func markChatAsRead(_ chat: Chat) {
        // Implementation for marking chat as read
        print("Marking chat with \(chat.user.name) as read")
    }
}
