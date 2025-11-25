//
//  MainBuilder.swift
//  MuseumGidOnline
//
//  Created by andrew on 24.11.25.
//

import UIKit
import NetworkKIT

final class MainBuilder: Builders {

    func makeVC(_ dependencies: Dependencies) -> NibViewController {

        let service: NetworkProvider = dependencies.service
        let viewModel: MainViewModelProtocol = MainViewModel()
        let view = MainViewController(viewModel: viewModel, service: service)
        let router: MainRouterProtocol = MainRouter(view: view, dependencies: dependencies)
        view.router = router
        
        view.modalPresentationStyle = .fullScreen
        return view
    }
}

protocol Builders{
    func makeVC(_ dependencies: Dependencies) -> NibViewController
    func makeNavigation(_ dependencies: Dependencies) -> UINavigationController
}

extension Builders {

    func makeNavigation(_ dependencies: Dependencies) -> UINavigationController {

        let cont = makeVC(dependencies)
        let navigationController = UINavigationController(rootViewController: cont)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = true
        navigationController.hidesBottomBarWhenPushed = true

        return navigationController
    }
}

