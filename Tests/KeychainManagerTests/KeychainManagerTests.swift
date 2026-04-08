//
//  File.swift
//  KeychainManager
//
//  Created by Emirhan Gökçe on 6.04.2026.
//

import XCTest
@testable import KeychainManager

@MainActor
final class KeychainManagerTests: XCTestCase {
    
    let keychain = KeychainManager.shared
    
    func test_save_and_get() {
        keychain.save("test123", forKey: "password")
        XCTAssertEqual(keychain.get(forKey: "password"), "test123")
    }
    
    func test_delete() {
        keychain.save("abc", forKey: "token")
        keychain.delete(forKey: "token")
        XCTAssertNil(keychain.get(forKey: "token"))
    }
    
    func test_update() {
        keychain.save("old", forKey: "apiKey")
        keychain.update("new", forKey: "apiKey")
        XCTAssertEqual(keychain.get(forKey: "apiKey"), "new")
    }
}
