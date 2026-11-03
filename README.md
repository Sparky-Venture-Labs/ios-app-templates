# ios-app-templates

A few SwiftUI views and extensions I kept rewriting, pulled out so I can drop them into a new app. No packages and
no dependencies: copy the file you want into your project.

Needs iOS 16 or later and Swift 5.9 (Xcode 15 or later).

## Components

| File | What it is | Use |
|---|---|---|
| `Components/EmptyStateView.swift` | Placeholder for an empty list: SF Symbol, title, message, and an optional button | `EmptyStateView(icon: "tray", title: "Nothing here", message: "Add something to get started")` |
| `Components/LoadingOverlay.swift` | Dimmed full-screen overlay with a spinner and a message, shown while a binding is true | `LoadingOverlay(isLoading: $isLoading, message: "Saving...")` |
| `Components/ToastNotification.swift` | A toast that slides up from the bottom and hides itself after 2.5 seconds (adjustable) | `ToastNotification(message: "Saved", isShowing: $showToast)` |

## Extensions

| File | What it adds |
|---|---|
| `Extensions/Color+Hex.swift` | `Color(hex: "#3b82f6")`, with 3, 6 or 8 hex digits (8 digits put alpha first: AARRGGBB). Anything else comes out black |
| `Extensions/View+Conditional.swift` | `.if(condition) { ... }` to apply a modifier only when a condition is true. It also has `ifAvailable(_:)`, which checks for iOS 16 no matter which version you pass |

## Example

```swift
struct ContentView: View {
    @State private var items: [String] = []
    @State private var showToast = false

    var body: some View {
        ZStack {
            if items.isEmpty {
                EmptyStateView(icon: "tray", title: "No items", message: "Tap Add to make one",
                               actionTitle: "Add", action: {
                                   items.append("New item")
                                   showToast = true
                               })
            } else {
                List(items, id: \.self) { Text($0) }
            }
            ToastNotification(message: "Added", isShowing: $showToast)
        }
    }
}
```

## License

MIT. See [LICENSE](LICENSE).
