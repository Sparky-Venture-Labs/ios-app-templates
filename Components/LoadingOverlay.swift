import SwiftUI

/// Full-screen loading overlay with optional message.
/// Usage: LoadingOverlay(isLoading: $isLoading, message: "Saving...")
struct LoadingOverlay: View {
    @Binding var isLoading: Bool
    var message: String = "Loading..."

    var body: some View {
        if isLoading {
            ZStack {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.4)

                    Text(message)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding(28)
                .background(Color(.systemGray6).opacity(0.9))
                .cornerRadius(16)
            }
            .transition(.opacity)
        }
    }
}
