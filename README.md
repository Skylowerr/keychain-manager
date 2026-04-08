# KeychainManager

A lightweight Swift library for securely storing sensitive 
data using Apple's Keychain Services. Built with no 
third-party dependencies.

## Features
- Save, read, update, and delete credentials securely
- Built on top of Apple's Security framework
- No third-party dependencies
- Unit tested

## Requirements
- iOS 13+ / macOS 10.15+
- Swift 5.0+
- Xcode 13+

## Installation

### Swift Package Manager
Add this to your `Package.swift`:

\```swift
dependencies: [
    .package(url: "https://github.com/Skylowerr/KeychainManager.git", 
             from: "1.0.0")
]
\```

## Usage

\```swift
import KeychainManager

// Save
KeychainManager.shared.save("myToken", forKey: "auth_token")

// Read
let token = KeychainManager.shared.get(forKey: "auth_token")

// Update
KeychainManager.shared.update("newToken", forKey: "auth_token")

// Delete
KeychainManager.shared.delete(forKey: "auth_token")
\```

## Why Keychain over UserDefaults?

| | UserDefaults | Keychain |
|---|---|---|
| Encrypted | ❌ | ✅ |
| Secure | ❌ | ✅ |
| Persists after uninstall | ❌ | ✅ |

## License
MIT
