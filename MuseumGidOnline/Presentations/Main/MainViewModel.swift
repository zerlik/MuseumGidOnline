//
//  MainViewModel.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import Foundation
import Combine
import NetworkKIT

protocol MainViewModelProtocol: AnyObject {
    var router: MainRouterProtocol? { get set }
    func loadUserSession()
}

final class MainViewModel: MainViewModelProtocol {
    
    var router: MainRouterProtocol?
    private let service: NetworkProvider
    private let userSessionRepository: UserSessionRepository
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: NetworkProvider, userSessionRepository: UserSessionRepository = DefaultUserSessionRepository()) {
        self.service = service
        self.userSessionRepository = userSessionRepository
    }
    
    func loadUserSession() {
        userSessionRepository.fetchUserSession()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] userSession in
                self?.goToNextScreen(userSession: userSession)
            }
            .store(in: &subscriptions)
    }
    
    private func goToNextScreen(userSession: UserSession?) {
        // for example only Small delay for splash screen effect
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            switch userSession {
            case .none:
                self.router?.navigate(to: .listCards)
//                self.router?.navigate(to: .auth)
            case .some(let userSession):
                if userSession.authState == .authorized {
                    self.router?.navigate(to: .listCards)
                } else {
                    self.router?.navigate(to: .auth)
                }
            }
        }
    }
}



