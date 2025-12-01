//
//  AuthViewModel.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import Foundation
import Combine
import UIKit
import NetworkKIT

protocol AuthViewModelProtocol: AnyObject {
    var router: AuthRouterProtocol? { get set }
    var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
    var errorMessagePublisher: AnyPublisher<String?, Never> { get }
    
    func signInWithAppleTapped()
    func signInWithGoogleTapped(presentingViewController: UIViewController)
}

@MainActor
final class AuthViewModel: AuthViewModelProtocol, ObservableObject {
    
    var router: AuthRouterProtocol?
    
    private let socialAuthService: SocialAuthServiceProtocol
    private let socialAuthClient: ApiClientSocialAuthProtocol
    private let userSession: UserSession
    
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    var isLoadingPublisher: AnyPublisher<Bool, Never> {
        $isLoading.eraseToAnyPublisher()
    }
    
    var errorMessagePublisher: AnyPublisher<String?, Never> {
        $errorMessage.eraseToAnyPublisher()
    }
    
    init(
        socialAuthService: SocialAuthServiceProtocol,
        socialAuthClient: ApiClientSocialAuthProtocol,
        userSession: UserSession
    ) {
        self.socialAuthService = socialAuthService
        self.socialAuthClient = socialAuthClient
        self.userSession = userSession
    }
    
    func signInWithAppleTapped() {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        socialAuthService.signInWithApple()
            .flatMap { [weak self] credential -> AnyPublisher<TokenModelResponse, AuthError> in
                guard let self = self else {
                    return Fail(error: AuthError.unknown).eraseToAnyPublisher()
                }
                return self.exchangeCredentialForToken(credential: credential, provider: .apple)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.handleError(error)
                }
            } receiveValue: { [weak self] tokenResponse in
                self?.handleSuccessfulAuth(tokenResponse)
            }
            .store(in: &subscriptions)
    }
    
    func signInWithGoogleTapped(presentingViewController: UIViewController) {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        
        socialAuthService.signInWithGoogle(presentingViewController: presentingViewController)
            .flatMap { [weak self] credential -> AnyPublisher<TokenModelResponse, AuthError> in
                guard let self = self else {
                    return Fail(error: AuthError.unknown).eraseToAnyPublisher()
                }
                return self.exchangeCredentialForToken(credential: credential, provider: .google)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.handleError(error)
                }
            } receiveValue: { [weak self] tokenResponse in
                self?.handleSuccessfulAuth(tokenResponse)
            }
            .store(in: &subscriptions)
    }
    
    private func exchangeCredentialForToken(
        credential: SocialAuthCredential,
        provider: AuthProviderType
    ) -> AnyPublisher<TokenModelResponse, AuthError> {
        
        let encoder = JSONEncoder()
        let requestData: Data
        
        do {
            switch provider {
            case .apple:
                let request = AppleLoginRequest(
                    idToken: credential.idToken,
                    email: credential.email,
                    fullName: credential.fullName
                )
                requestData = try encoder.encode(request)
            case .google:
                let request = GoogleLoginRequest(
                    idToken: credential.idToken,
                    email: credential.email,
                    fullName: credential.fullName
                )
                requestData = try encoder.encode(request)
            }
        } catch {
            return Fail(error: AuthError.invalidCredential).eraseToAnyPublisher()
        }
        
        let publisher: AnyPublisher<TokenModelResponse, ApplicationError>?
        
        switch provider {
        case .apple:
            publisher = socialAuthClient.appleLogin(requestData: requestData)
        case .google:
            publisher = socialAuthClient.googleLogin(requestData: requestData)
        }
        
        guard let publisher = publisher else {
            return Fail(error: AuthError.networkError(NSError(domain: "NetworkError", code: -1)))
                .eraseToAnyPublisher()
        }
        
        return publisher
            .mapError { error in
                AuthError.networkError(error)
            }
            .eraseToAnyPublisher()
    }
    
    private func handleSuccessfulAuth(_ tokenResponse: TokenModelResponse) {
        TokenStorage.shared.accessToken = tokenResponse.accessToken
        TokenStorage.shared.refreshToken = tokenResponse.refreshToken
        userSession.authState = .authorized
        router?.navigate(to: .signedIn)
    }
    
    private func handleError(_ error: AuthError) {
        switch error {
        case .cancelled:
            errorMessage = nil
        default:
            errorMessage = error.localizedDescription
        }
    }
}



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



