//
//  AuthNetworkRouter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//
import Foundation

enum  AuthNetworkRouter: NetworkRouter  {
    
    case registrationEmail(body: Data, registrationToken: String)
    case emailLogin(body: Data, registrationToken: String)
    
    var httpMethod : HTTPMethod {
        switch self {
        case .registrationEmail, .emailLogin:
            return .post
        }
    }
    
    var contentType: ContentType? {
        switch self {
        case .registrationEmail, .emailLogin:
            return .json
        }
    }
    
    var path: String {
        switch self {
        case .registrationEmail:
            return "/registration"
        case .emailLogin:
            return "/login"
        }
    }
    
    var bodyData: Data? {
        switch self {
        case .registrationEmail(let data, _ ), .emailLogin(let data, _):
            return data
        }
    }
    
    var urlParams: Parameters? {
        switch self {
        case .registrationEmail, .emailLogin:
            return nil
        }
    }
    
    var autorization: String? {
        switch self {
        case  .emailLogin(_ , let registrationToken), .registrationEmail(_, let registrationToken):
            return "Bearer \(registrationToken)"
        }
    }
    
    private func codingAutorization(autorization: String?)-> String? {
        let autorizationData = autorization?.data(using: String.Encoding.utf8)
        if let base64EncodedCredential = autorizationData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0)){
            return "Basic \(base64EncodedCredential)"
        } else {
            return nil
        }
    }
}
