//
//  ListCardsBuilder.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import UIKit
import NetworkKIT

final class ListCardsBuilder: Builders {

    func makeVC(_ dependencies: Dependencies) -> NibViewController {

        let service: NetworkProvider = dependencies.service
        let viewModel: ListCardsViewModelProtocol = ListCardsViewModel()
        let view = ListCardsViewController(viewModel: viewModel, service: service)
        let router: ListCardsRouterProtocol = ListCardsRouter(view: view, dependencies: dependencies)
        view.router = router
        
        view.modalPresentationStyle = .fullScreen
        return view
    }
}
