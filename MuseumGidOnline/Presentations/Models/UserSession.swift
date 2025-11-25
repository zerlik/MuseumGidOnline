//
//  UserSession.swift
//  MuseumGidOnline
//
//  Created by andrew on 24.11.25.
//

final class UserSession {

    enum AuthState {
        case authorized
        case noAuthorized
    }

    var authState: AuthState = .noAuthorized

    init(){}
}



