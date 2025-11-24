//
//  NetworkProvider.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

import Foundation
import Combine

 protocol ApiClientAuthProtocols {
     func login(requestData: Data, registrationToken: String) -> AnyPublisher<TokenModelResponse, ApplicationError>?
     func registration(requestData: Data, registrationToken: String
    ) -> AnyPublisher<TokenModelResponse, ApplicationError>?
}

public class NetworkProvider {

    public init(){}

     func makeAuthNetwork() -> ApiClientAuthProtocols {
        let network = NetworkFetcher()
        return ApiClientAuth(network: network)
    }

    //GRPC API
//    func makeUserGRPCNetwork() -> UserService {
//        let network = DefaultGRPCService()
//        return network.userServiceClient()
//    }
}
