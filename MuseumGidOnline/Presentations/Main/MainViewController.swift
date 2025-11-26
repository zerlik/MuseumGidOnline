//
//  MainViewController.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import UIKit
import NetworkKIT

protocol MainViewControllerProtocol: AnyObject {
   
}

final class MainViewController: NibViewController {
    
    private let viewModel: MainViewModelProtocol
    private let service: NetworkProvider
    var router: MainRouterProtocol?
    
    init( viewModel: MainViewModelProtocol, service: NetworkProvider) {
        self.viewModel = viewModel
        self.service = service
        super.init()
    }
    
    override func loadView() {
        view = MainRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        router?.navigate(to: .listCards)
    }
    
    @objc private func authButtonAction(){

    }
    
    @objc private func appButtonAction(){

    }
}


