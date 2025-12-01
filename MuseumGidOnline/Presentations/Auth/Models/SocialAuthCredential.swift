//
//  SocialAuthCredential.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import Foundation

struct SocialAuthCredential {
    let provider: AuthProviderType
    let idToken: String
    let email: String?
    let fullName: String?
    
    init(provider: AuthProviderType, idToken: String, email: String? = nil, fullName: String? = nil) {
        self.provider = provider
        self.idToken = idToken
        self.email = email
        self.fullName = fullName
    }
}



