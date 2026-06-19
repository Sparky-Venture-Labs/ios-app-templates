import SwiftUI

extension View {
    /// Conditionally apply a modifier.
    /// Usage: Text("Hello").if(isRed) { $0.foregroundColor(.red) }
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    /// Apply a modifier only on a specific iOS version.
    @ViewBuilder
    func ifAvailable(_ version: Double, transform: (Self) -> some View) -> some View {
        if #available(iOS 16, *) {
            transform(self)
        } else {
            self
        }
    }
}
