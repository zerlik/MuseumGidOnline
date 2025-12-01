//
//  SocialAuthNetworkRouter.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import Foundation

enum SocialAuthNetworkRouter: NetworkRouter {
    
    case appleLogin(body: Data)
    case googleLogin(body: Data)
    
    var httpMethod: HTTPMethod {
        switch self {
        case .appleLogin, .googleLogin:
            return .post
        }
    }
    
    var contentType: ContentType? {
        switch self {
        case .appleLogin, .googleLogin:
            return .json
        }
    }
    
    var path: String {
        switch self {
        case .appleLogin:
            return "/auth/apple"
        case .googleLogin:
            return "/auth/google"
        }
    }
    
    var bodyData: Data? {
        switch self {
        case .appleLogin(let data), .googleLogin(let data):
            return data
        }
    }
    
    var urlParams: Parameters? {
        switch self {
        case .appleLogin, .googleLogin:
            return nil
        }
    }
    
    var autorization: String? {
        switch self {
        case .appleLogin, .googleLogin:
            return nil
        }
    }
}



