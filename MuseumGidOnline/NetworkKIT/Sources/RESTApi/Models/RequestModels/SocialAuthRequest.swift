//
//  SocialAuthRequest.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import Foundation

public struct AppleLoginRequest: Codable {
    let idToken: String
    let email: String?
    let fullName: String?
}

public struct GoogleLoginRequest: Codable {
    let idToken: String
    let email: String?
    let fullName: String?
}



