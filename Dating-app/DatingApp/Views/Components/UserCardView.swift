import SwiftUI
import Combine

struct UserCardView: View {
    let user: User
   
    var body: some View {
        VStack(spacing: 0) {
            UserImagePlaceholder()
           
            UserInfoView(user: user)
        }
        .frame(width: 160)
    }
}

struct UserCardsScrollView: View {
    let users: [User]
   
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(users) { user in
                    UserCardView(user: user)
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.top, 20)
    }
}

struct UserImagePlaceholder: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(LinearGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.blue.opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            .frame(width: 160, height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
    }
}

struct UserInfoView: View {
    let user: User
   
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(user.displayName)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
           
            if let bio = user.bio {
                Text(bio)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 8)
    }
}
