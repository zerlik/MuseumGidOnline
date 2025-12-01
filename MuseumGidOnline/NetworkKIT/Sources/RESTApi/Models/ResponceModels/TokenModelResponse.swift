//
//  TokenModelResponse.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//

import Foundation

public struct TokenModelResponse: Decodable {
    public var accessToken: String
    var tokenType: String
    public var refreshToken: String?
    var expiresIn: Int
    var scope: String
    var jti: String
    var creationTime: Date? = Date()
}

