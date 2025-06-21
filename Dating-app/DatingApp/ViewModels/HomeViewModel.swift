import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var pendingUsers: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
   
    private let userService: UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
   
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
        loadPendingUsers()
    }
   
    func loadPendingUsers() {
        isLoading = true
        errorMessage = nil
       
        userService.fetchPendingUsers()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                },
                receiveValue: { [weak self] users in
                    self?.pendingUsers = users
                }
            )
            .store(in: &cancellables)
    }
}
