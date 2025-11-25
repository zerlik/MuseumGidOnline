//
//  Future+Async.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import Combine

extension Future where Failure == APIError {
    convenience init(asyncFunc: @escaping () async throws -> Output) {
        self.init { promise in
            Task {
                do {
                    let result = try await asyncFunc()
                    promise(.success(result))
                } catch {
                    var message = error.localizedDescription
                    promise(.failure(APIError(message: message, underlyingError: error)))
                }
            }
        }
    }
}

import Foundation

struct APIError: LocalizedError {
    var title: String?
    var message: String?
    var underlyingError: Error?
    let isUnhandled: Bool
    
    init(title: String? = nil, message: String? = nil, underlyingError: Error? = nil, isUnhandled: Bool = false) {
        self.title = title
        self.message = message
        self.underlyingError = underlyingError
        self.isUnhandled = isUnhandled
    }
    
    var errorDescription: String { message ?? underlyingError?.localizedDescription ?? localizedDescription }
    var isNotEmpty: Bool { title?.isNotEmptyOrWhitespace == true || message?.isNotEmptyOrWhitespace == true }
}

extension APIError {
    static let empty = APIError()
}

extension Error {
    var asAPIError: APIError? { self as? APIError }
}

