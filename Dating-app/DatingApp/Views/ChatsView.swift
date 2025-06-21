import SwiftUI
import Combine

struct ChatsView: View {
    @StateObject private var viewModel = ChatsViewModel()
   
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
               
                VStack(spacing: 0) {
                    ChatsHeaderView()
                   
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        ChatListView(chats: viewModel.chats, onChatTap: viewModel.markChatAsRead)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.loadChats()
        }
    }
}

struct ChatContentView: View {
    let chat: Chat
   
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(chat.user.name)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
               
                if chat.user.isOnline && chat.user.name == "Jessica" {
                    OnlineBadge()
                }
               
                Spacer()
               
                if !chat.timeString.isEmpty {
                    Text(chat.timeString)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
           
            if let lastMessage = chat.lastMessage {
                Text(lastMessage.content)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
        }
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}
