# KeychainManager 🔐

A lightweight Swift library for securely storing sensitive data using Apple's Keychain Services. Built with no third-party dependencies.

---

## Features

- 🔑 Save, read, update, and delete credentials securely
- 🔒 Built on top of Apple's Security framework
- 📦 No third-party dependencies
- ✅ Unit tested

---
---

## Why Keychain over UserDefaults?

| | UserDefaults | Keychain |
|---|---|---|
| Encrypted | ❌ | ✅ |
| Secure | ❌ | ✅ |
| Persists after uninstall | ❌ | ✅ |

---

## Installation

### Swift Package Manager

Add this to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Skylowerr/KeychainManager.git", from: "1.0.0")
]
```

Or in Xcode:
1. File → Add Package Dependencies
2. Paste the repository URL
3. Click Add Package

---

## Usage

```swift
import KeychainManager

// Save
KeychainManager.shared.save("myToken", forKey: "auth_token")

// Read
let token = KeychainManager.shared.get(forKey: "auth_token")

// Update
KeychainManager.shared.update("newToken", forKey: "auth_token")

// Delete
KeychainManager.shared.delete(forKey: "auth_token")
```

---

## Real World Example

```swift
// After login — save token securely
func didLogin(token: String) {
    KeychainManager.shared.save(token, forKey: "auth_token")
}

// On every API request — read token
func getAuthToken() -> String? {
    return KeychainManager.shared.get(forKey: "auth_token")
}

// On logout — remove token
func didLogout() {
    KeychainManager.shared.delete(forKey: "auth_token")
}
```

---

## Tech Stack

- **Swift** — core implementation
- **Security Framework** — Apple's native Keychain API
- **Swift Package Manager** — distribution and integration
- **XCTest** — unit testing

---

## Requirements

- iOS 13+ / macOS 10.15+
- Swift 5.0+
- Xcode 13+

---

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/Skylowerr/KeychainManager.git
```
2. Open in Xcode
3. Press ⌘U to run unit tests

---

## What I Learned

- 🔐 **Keychain Services** — working directly with Apple's Security framework
- 📦 **Swift Package Manager** — creating and distributing a reusable library
- 🧪 **Unit testing** — writing XCTest cases to verify security-critical functionality
- 🏗️ **Singleton pattern** — designing a shared, thread-safe access point

---

## License

MIT
