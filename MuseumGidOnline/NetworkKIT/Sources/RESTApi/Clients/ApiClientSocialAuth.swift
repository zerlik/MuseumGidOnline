//
//  ApiClientSocialAuth.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import Foundation
import Combine

public protocol ApiClientSocialAuthProtocol {
    func appleLogin(requestData: Data) -> AnyPublisher<TokenModelResponse, ApplicationError>?
    func googleLogin(requestData: Data) -> AnyPublisher<TokenModelResponse, ApplicationError>?
}

final class ApiClientSocialAuth: ApiClientSocialAuthProtocol {
    
    private let network: NetworkFetcher
    
    init(network: NetworkFetcher) {
        self.network = network
    }
    
    func appleLogin(requestData: Data) -> AnyPublisher<TokenModelResponse, ApplicationError>? {
        var request: URLRequest?
        do {
            request = try SocialAuthNetworkRouter.appleLogin(body: requestData).asURLRequest()
        } catch {
            print(error)
            return nil
        }
        guard let request = request else { return nil }
        return network.run(request)
            .eraseToAnyPublisher()
    }
    
    func googleLogin(requestData: Data) -> AnyPublisher<TokenModelResponse, ApplicationError>? {
        var request: URLRequest?
        do {
            request = try SocialAuthNetworkRouter.googleLogin(body: requestData).asURLRequest()
        } catch {
            print(error)
            return nil
        }
        guard let request = request else { return nil }
        return network.run(request)
            .eraseToAnyPublisher()
    }
}



