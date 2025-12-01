//
//  DefaultUserSessionRepository.swift
//  MuseumGidOnline
//
//  Created by andrew on 26.11.25.
//

import Foundation
import Combine

protocol UserSessionRepository {
    func fetchUserSession() -> AnyPublisher<UserSession?, Never>
    func saveUserSession(_ session: UserSession) -> AnyPublisher<Void, Never>
    func clearUserSession() -> AnyPublisher<Void, Never>
}

final class DefaultUserSessionRepository: UserSessionRepository {
    
    private let tokenStorage: TokenStorage
    
    init(tokenStorage: TokenStorage = .shared) {
        self.tokenStorage = tokenStorage
    }
    
    func fetchUserSession() -> AnyPublisher<UserSession?, Never> {
        return Future { [weak self] promise in
            guard let self = self else {
                promise(.success(nil))
                return
            }
            
            // Check user has valid tokens-Keychain
            if self.tokenStorage.hasValidTokens {
                let session = UserSession()
                session.authState = .authorized
                promise(.success(session))
            } else {
                promise(.success(nil))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func saveUserSession(_ session: UserSession) -> AnyPublisher<Void, Never> {
        return Future { promise in
            // Token saving is handled by TokenModelResponse.saveInKeychain()
            promise(.success(()))
        }
        .eraseToAnyPublisher()
    }
    
    func clearUserSession() -> AnyPublisher<Void, Never> {
        return Future { [weak self] promise in
            guard let self = self else {
                promise(.success(()))
                return
            }
            
            self.tokenStorage.clearAll()
            promise(.success(()))
        }
        .eraseToAnyPublisher()
    }
}
