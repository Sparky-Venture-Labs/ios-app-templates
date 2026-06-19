# ios-app-templates

Reusable SwiftUI components and patterns for iOS app development. Generic building blocks — nothing app-specific, just patterns that show up in almost every project.

Requires iOS 16+ and Xcode 15+.

---

## Components

| Component | What it is |
|---|---|
| `OnboardingFlow` | Multi-step onboarding with page indicators |
| `SettingsView` | Standard settings page with sections and toggles |
| `LoadingOverlay` | Full-screen loading state with activity indicator |
| `EmptyStateView` | Empty list/collection placeholder with icon and message |
| `ToastNotification` | Non-blocking toast notification from bottom of screen |
| `ConfirmationSheet` | Bottom sheet confirmation dialog |

---

## Usage

Each component is self-contained in its own Swift file. Copy the file into your project and use directly — no package dependencies.

```swift
// Example — ToastNotification
ToastNotification(message: "Saved successfully", isShowing: $showToast)
```

---

## Structure

```
ios-app-templates/
├── Components/
│   ├── OnboardingFlow.swift
│   ├── SettingsView.swift
│   ├── LoadingOverlay.swift
│   ├── EmptyStateView.swift
│   ├── ToastNotification.swift
│   └── ConfirmationSheet.swift
└── Extensions/
    ├── Color+Hex.swift
    ├── View+Conditional.swift
    └── String+Validation.swift
```

---

## Requirements

- iOS 16+
- Xcode 15+
- Swift 5.9+
