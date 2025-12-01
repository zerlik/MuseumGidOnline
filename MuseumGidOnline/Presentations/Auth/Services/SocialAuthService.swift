//
//  SocialAuthService.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import UIKit
import Combine
import AuthenticationServices
import GoogleSignIn

final class SocialAuthService: NSObject, SocialAuthServiceProtocol {
    
    private var appleSignInSubject: PassthroughSubject<SocialAuthCredential, AuthError>?
    private var googleSignInSubject: PassthroughSubject<SocialAuthCredential, AuthError>?
    
    // MARK: - Apple Sign In
    
    func signInWithApple() -> AnyPublisher<SocialAuthCredential, AuthError> {
        let subject = PassthroughSubject<SocialAuthCredential, AuthError>()
        self.appleSignInSubject = subject
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
        
        return subject.eraseToAnyPublisher()
    }
    
    // MARK: - Google Sign In
    
    func signInWithGoogle(presentingViewController: UIViewController) -> AnyPublisher<SocialAuthCredential, AuthError> {
        let subject = PassthroughSubject<SocialAuthCredential, AuthError>()
        self.googleSignInSubject = subject
        
        guard let clientID = GIDSignIn.sharedInstance.configuration?.clientID else {
            subject.send(completion: .failure(.invalidCredential))
            return subject.eraseToAnyPublisher()
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { [weak self] signInResult, error in
            guard let self = self else { return }
            
            if let error = error {
                let nsError = error as NSError
                if nsError.code == GIDSignInError.canceled.rawValue {
                    subject.send(completion: .failure(.cancelled))
                } else {
                    subject.send(completion: .failure(.providerError(error)))
                }
                return
            }
            
            guard let signInResult = signInResult else {
                subject.send(completion: .failure(.invalidCredential))
                return
            }
            
            guard let idToken = signInResult.user.idToken?.tokenString else {
                subject.send(completion: .failure(.missingToken))
                return
            }
            
            let email = signInResult.user.profile?.email
            let fullName = signInResult.user.profile?.name
            
            let credential = SocialAuthCredential(
                provider: .google,
                idToken: idToken,
                email: email,
                fullName: fullName
            )
            
            subject.send(credential)
            subject.send(completion: .finished)
        }
        
        return subject.eraseToAnyPublisher()
    }
}

// MARK: - ASAuthorizationControllerDelegate

extension SocialAuthService: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            appleSignInSubject?.send(completion: .failure(.invalidCredential))
            return
        }
        
        guard let identityTokenData = appleIDCredential.identityToken,
              let identityToken = String(data: identityTokenData, encoding: .utf8) else {
            appleSignInSubject?.send(completion: .failure(.missingToken))
            return
        }
        
        let email = appleIDCredential.email
        let fullName: String? = {
            if let givenName = appleIDCredential.fullName?.givenName,
               let familyName = appleIDCredential.fullName?.familyName {
                return "\(givenName) \(familyName)"
            }
            return nil
        }()
        
        let credential = SocialAuthCredential(
            provider: .apple,
            idToken: identityToken,
            email: email,
            fullName: fullName
        )
        
        appleSignInSubject?.send(credential)
        appleSignInSubject?.send(completion: .finished)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        let authError = error as? ASAuthorizationError
        if authError?.code == .canceled {
            appleSignInSubject?.send(completion: .failure(.cancelled))
        } else {
            appleSignInSubject?.send(completion: .failure(.providerError(error)))
        }
    }
}



