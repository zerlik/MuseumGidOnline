//
//  AuthError.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import Foundation

enum AuthError: Error, LocalizedError {
    case cancelled
    case missingToken
    case invalidCredential
    case providerError(Error)
    case networkError(Error)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .cancelled:
            return "Авторизация отменена"
        case .missingToken:
            return "Не удалось получить токен авторизации"
        case .invalidCredential:
            return "Неверные учетные данные"
        case .providerError(let error):
            return "Ошибка провайдера: \(error.localizedDescription)"
        case .networkError(let error):
            return "Ошибка сети: \(error.localizedDescription)"
        case .unknown:
            return "Неизвестная ошибка"
        }
    }
}



