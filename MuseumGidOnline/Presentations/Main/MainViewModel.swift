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
    var router: MainRouterProtocol?{get set}
    func loadUserSession()
}

final class MainViewModel: MainViewModelProtocol  {
    
    var router: MainRouterProtocol?
    private let service: NetworkProvider
    
    init(service: NetworkProvider) {
        self.service = service
    }
    
    func loadUserSession() {
//        loginSubscription = Publishers
//            .CombineLatest(
//                userSessionRepository.fetchUserSession(),
//                bundleSettingsSubject
//            )
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] userSession, bundleSettings in
                
        goToNextScreen(userSession: UserSession())
    }
    
    private func goToNextScreen(userSession: UserSession?) {
        // for example only
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            switch userSession {
            case .none:
                self.router?.navigate(to: .auth)
            case .some(let userSession):
                self.router?.navigate(to: .listCards)
            }
        }
    }
}



