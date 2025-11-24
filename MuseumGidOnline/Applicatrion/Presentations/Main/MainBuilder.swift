//
//  MainBuilder.swift
//  MuseumGidOnline
//
//  Created by andrew on 24.11.25.
//

import UIKit

final class MainBuilder: Builders {

    func makeVC(_ dependencies: Dependencies) -> UIViewController {

//        let presenter: OutputMainRemoteDataManagerProtocol & MainPresenterProtocol = MainPresenter()
//        let repo: InputMainRemoteDataManagerProtocol = MainRepository(presenter, service: dependencies.service)
//        
//        let controller = MainViewController(presenter: presenter)
//        presenter.view = controller as MainViewControllerProtocol
//        presenter.repository = repo
//
//        let router: MainRouterProtocol = MainRouter(view: controller, dependencies: dependencies)
//        presenter.router = router
//        
//        controller.modalPresentationStyle = .fullScreen
//        
//        return controller
        let view = UIViewController()
        view.view.backgroundColor = .yellow
        return view
    }
}

protocol Builders{
    func makeVC(_ dependencies: Dependencies) -> UIViewController
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

