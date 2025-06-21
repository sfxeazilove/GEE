import SwiftUI
import Combine

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
   
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
           
            VStack(spacing: 0) {
                HeaderView()
               
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    UserCardsScrollView(users: viewModel.pendingUsers)
                }
               
                Spacer()
            }
        }
        .onAppear {
            viewModel.loadPendingUsers()
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Your Turn")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
               
                Spacer()
               
                OverlappingProfilePictures()
            }
           
            Text("New your Turn - they are waiting")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
}

struct OverlappingProfilePictures: View {
    var body: some View {
        HStack(spacing: -10) {
            ProfileCircle(initial: "A", color: .green)
            ProfileCircle(initial: "M", color: .purple)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
