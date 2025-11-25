//
//  ListCardsViewController.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import UIKit
import NetworkKIT

protocol ListCardsControllerProtocol: AnyObject {
   
}

final class ListCardsViewController: NibViewController {
    
    private let viewModel: ListCardsViewModelProtocol
    private let service: NetworkProvider
    var router: ListCardsRouterProtocol?
    
    init( viewModel: ListCardsViewModelProtocol, service: NetworkProvider) {
        self.viewModel = viewModel
        self.service = service
        super.init()
    }
    
    override func loadView() {
        view = ListCardsRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }
    
    @objc private func authButtonAction(){
    }
    
    @objc private func appButtonAction(){
    }
}

extension MainViewController: MainViewControllerProtocol {
    
}

