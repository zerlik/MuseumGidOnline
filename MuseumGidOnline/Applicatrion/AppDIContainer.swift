//
//  AppDIContainer.swift
//  MuseumGidOnline
//
//  Created by andrew on 24.11.25.
//

import UIKit

// My Dev Pack
import NetworkKIT

struct Dependencies {
    let service: NetworkProvider
    let userSession: UserSession
}

final class AppDIContainer {
    
    private let appConfiguration: AppConfiguration
    private let appCustomization: AppCustomization
    
    init() {
        self.appConfiguration = AppConfiguration()
        self.appCustomization = AppCustomization()
        
    }
}

extension AppDIContainer {
    func makeMainViewController() -> UINavigationController {
        
        let network = NetworkProvider()
        let userSession = UserSession()
        let dependencies = Dependencies(service: network, userSession: userSession)

        return MainBuilder().makeNavigation(dependencies)
    }
}


