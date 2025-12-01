//
//  AuthBuilder.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import UIKit
import NetworkKIT

final class AuthBuilder: Builders {
    
    func makeVC(_ dependencies: Dependencies) -> NibViewController {
        
        let service: NetworkProvider = dependencies.service
        let userSession: UserSession = dependencies.userSession
        
        // Create services
        let socialAuthService: SocialAuthServiceProtocol = SocialAuthService()
        let socialAuthClient: ApiClientSocialAuthProtocol = service.makeSocialAuthNetwork()
        
        // Create ViewModel
        let viewModel: AuthViewModelProtocol = AuthViewModel(
            socialAuthService: socialAuthService,
            socialAuthClient: socialAuthClient,
            userSession: userSession
        )
        
        // Create View
        let view = AuthViewController(viewModel: viewModel)
        
        // Create Router
        let router: AuthRouterProtocol = AuthRouter(view: view, dependencies: dependencies)
        viewModel.router = router
        
        view.modalPresentationStyle = .fullScreen
        return view
    }
}



