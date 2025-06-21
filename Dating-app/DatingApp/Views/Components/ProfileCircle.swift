import SwiftUI
import Combine

struct ProfileCircle: View {
    let initial: String
    let color: Color
   
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 35, height: 35)
            .overlay(
                Text(initial)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
            )
    }
}

struct ProfilePictureView: View {
    let user: User
   
    var body: some View {
        ZStack {
            Circle()
                .fill(profileColor(for: user.name))
                .frame(width: 50, height: 50)
           
            Text(user.initials)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium))
           
            if user.isOnline {
                OnlineIndicator()
            }
        }
    }
   
    private func profileColor(for name: String) -> Color {
        switch name {
        case "Jessica": return .green
        case "Amanda": return .purple
        case "You": return .orange
        case "Malti": return .blue
        default: return .gray
        }
    }
}

struct OnlineIndicator: View {
    var body: some View {
        Circle()
            .fill(Color.green)
            .frame(width: 14, height: 14)
            .overlay(
                Circle()
                    .stroke(Color.black, lineWidth: 2)
            )
            .offset(x: 18, y: 18)
    }
}
