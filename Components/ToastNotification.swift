import SwiftUI

/// Non-blocking toast notification that appears from the bottom of the screen.
/// Usage: ToastNotification(message: "Saved", isShowing: $showToast)
struct ToastNotification: View {
    let message: String
    @Binding var isShowing: Bool
    var duration: Double = 2.5

    var body: some View {
        VStack {
            Spacer()
            if isShowing {
                Text(message)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(20)
                    .padding(.bottom, 32)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            withAnimation {
                                isShowing = false
                            }
                        }
                    }
            }
        }
        .animation(.spring(), value: isShowing)
        .ignoresSafeArea()
    }
}
