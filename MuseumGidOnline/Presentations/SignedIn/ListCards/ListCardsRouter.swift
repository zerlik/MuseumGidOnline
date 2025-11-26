//
//  ListCardsRouter.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import UIKit

enum ListCardsRouterCases: Equatable {
    
    case dissmiss
    case weather

    static func == (lhs: ListCardsRouterCases, rhs: ListCardsRouterCases) -> Bool {
        return true
    }
}

protocol ListCardsRouterProtocol: AnyObject {
    func navigate(to route: ListCardsRouterCases)
}

final class ListCardsRouter: ListCardsRouterProtocol {
    
    private weak var view: UIViewController?
    private var dependencies: Dependencies
    
    init(view: UIViewController, dependencies: Dependencies) {
        self.view = view
        self.dependencies = dependencies
    }
    
    func navigate(to route: ListCardsRouterCases) {
        switch route {
      
        case .weather:
            let vc = ListCardsBuilder().makeVC(dependencies)
            self.view?.navigationController?.pushViewController(vc, animated: true)

        case .dissmiss:
            dissmisVC()
        }
    }
    
    private func dissmisVC(){
        guard view?.navigationController?.popViewController(animated: true) != nil else {
            view?.dismiss(animated: true, completion: nil)
            return
        }
    }
}

