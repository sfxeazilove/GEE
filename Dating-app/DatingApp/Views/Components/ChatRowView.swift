import SwiftUI
import Combine

struct ChatRowView: View {
    let chat: Chat
   
    var body: some View {
        HStack(spacing: 12) {
            ProfilePictureView(user: chat.user)
           
            ChatContentView(chat: chat)
           
            Spacer()
           
            if chat.unreadCount > 0 {
                UnreadIndicator()
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
    }
}

struct ChatsHeaderView: View {
    var body: some View {
        HStack {
            Text("Chats")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
           
            Spacer()
           
            Text("Pending")
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
}

struct ChatListView: View {
    let chats: [Chat]
    let onChatTap: (Chat) -> Void
   
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(chats) { chat in
                    ChatRowView(chat: chat)
                        .onTapGesture {
                            onChatTap(chat)
                        }
                }
            }
        }
        .padding(.top, 20)
    }
}

struct OnlineBadge: View {
    var body: some View {
        Text("ONLINE")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.green)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(Color.green.opacity(0.2))
            .cornerRadius(4)
    }
}

struct UnreadIndicator: View {
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 8, height: 8)
    }
}
