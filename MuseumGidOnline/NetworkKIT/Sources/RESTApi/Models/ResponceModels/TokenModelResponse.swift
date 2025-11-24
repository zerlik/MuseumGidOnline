//
//  TokenModelResponse.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//

import Foundation

struct TokenModelResponse: Decodable {
    var accessToken: String
    var tokenType: String
    var refreshToken: String?
    var expiresIn: Int
    var scope: String
    var jti: String
    var creationTime: Date? = Date()
    
    func saveInKeychain(){
//        KeychainTokens().accessToken = accessToken
//        KeychainTokens().refreshToken = refreshToken
    }
}

