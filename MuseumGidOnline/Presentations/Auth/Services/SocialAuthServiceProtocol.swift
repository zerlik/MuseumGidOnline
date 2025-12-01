//
//  SocialAuthServiceProtocol.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import UIKit
import Combine

protocol SocialAuthServiceProtocol {
    func signInWithApple() -> AnyPublisher<SocialAuthCredential, AuthError>
    func signInWithGoogle(presentingViewController: UIViewController) -> AnyPublisher<SocialAuthCredential, AuthError>
}



