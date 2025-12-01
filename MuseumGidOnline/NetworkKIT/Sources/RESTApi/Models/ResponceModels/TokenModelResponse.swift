//
//  TokenModelResponse.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//

import Foundation

public struct TokenModelResponse: Decodable {
    var accessToken: String
    var tokenType: String
    var refreshToken: String?
    var expiresIn: Int
    var scope: String
    var jti: String
    var creationTime: Date? = Date()
    
   public func saveInKeychain(){
//        TokenStorage.shared.accessToken = accessToken
//        TokenStorage.shared.refreshToken = refreshToken
    }
}

