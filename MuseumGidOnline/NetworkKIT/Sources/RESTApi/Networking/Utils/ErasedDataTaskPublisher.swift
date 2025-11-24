//
//  ErasedDataTaskPublisher.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//

import Foundation
import Combine

extension URLSession.ErasedDataTaskPublisher {
    
}

extension URLSession {
    typealias ErasedDataTaskPublisher = AnyPublisher<(data: Data, response: URLResponse), Error>
    
    func erasedDataTaskPublisher(for request: URLRequest) -> ErasedDataTaskPublisher {
        dataTaskPublisher(for: request)
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}

