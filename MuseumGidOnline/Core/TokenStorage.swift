//
//  TokenStorage.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import Foundation

final class TokenStorage {
    
    static let shared = TokenStorage()
    
    private let keychainManager = KeychainManager.shared
    private let service = "belarusmini.by.MuseumGidOnline.tokens"
    
    private enum Keys {
        static let accessToken = "accessToken"
        static let refreshToken = "refreshToken"
    }
    
    private init() {}
    
    var accessToken: String? {
        get {
            try? keychainManager.retrieveString(service: service, account: Keys.accessToken)
        }
        set {
            if let token = newValue {
                try? keychainManager.save(token, service: service, account: Keys.accessToken)
            } else {
                try? keychainManager.delete(service: service, account: Keys.accessToken)
            }
        }
    }
    
    var refreshToken: String? {
        get {
            try? keychainManager.retrieveString(service: service, account: Keys.refreshToken)
        }
        set {
            if let token = newValue {
                try? keychainManager.save(token, service: service, account: Keys.refreshToken)
            } else {
                try? keychainManager.delete(service: service, account: Keys.refreshToken)
            }
        }
    }
    
    func clearAll() {
        try? keychainManager.clearAll(service: service)
    }
    
    var hasValidTokens: Bool {
        return accessToken != nil
    }
}

