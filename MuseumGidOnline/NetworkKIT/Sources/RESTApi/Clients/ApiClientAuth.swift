//
//  ApiClientAuth.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//

import Foundation
import Combine

internal final class ApiClientAuth: ApiClientAuthProtocols {

    private let network: NetworkFetcher

    init(network: NetworkFetcher) {
        self.network = network
    }

     func registration(requestData: Data, registrationToken: String
    ) -> AnyPublisher<TokenModelResponse, ApplicationError>? {
        var request: URLRequest?
        do {
            request = try AuthNetworkRouter.registrationEmail(body: requestData, registrationToken: registrationToken).asURLRequest()
        } catch {
            print(error)
            return nil
        }
        guard let request = request else{ return nil }// case only for dev
        return network.run(request)
            .eraseToAnyPublisher()
    }

     func login(requestData: Data, registrationToken: String) -> AnyPublisher<TokenModelResponse, ApplicationError>?{
        var request: URLRequest?
        do {
            request = try AuthNetworkRouter.emailLogin(body: requestData, registrationToken: registrationToken).asURLRequest()
        } catch {
            print(error)
            return nil
        }
        guard let request = request else{ return nil }// case only for dev
        return network.run(request)
            .eraseToAnyPublisher()
    }
}
