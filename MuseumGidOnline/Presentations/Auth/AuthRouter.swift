//
//  AuthRouter.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import UIKit

enum AuthRouterCases: Equatable {
    
    case dismiss
    case signedIn
    
    static func == (lhs: AuthRouterCases, rhs: AuthRouterCases) -> Bool {
        return true
    }
}

protocol AuthRouterProtocol: AnyObject {
    func navigate(to route: AuthRouterCases)
}

final class AuthRouter: AuthRouterProtocol {
    
    private weak var view: UIViewController?
    private var dependencies: Dependencies
    
    init(view: UIViewController, dependencies: Dependencies) {
        self.view = view
        self.dependencies = dependencies
    }
    
    func navigate(to route: AuthRouterCases) {
        switch route {
        case .signedIn:
            let vc = ListCardsBuilder().makeVC(dependencies)
            self.view?.navigationController?.pushViewController(vc, animated: true)
            
        case .dismiss:
            dismissVC()
        }
    }
    
    private func dismissVC() {
        guard view?.navigationController?.popViewController(animated: true) != nil else {
            view?.dismiss(animated: true, completion: nil)
            return
        }
    }
}



