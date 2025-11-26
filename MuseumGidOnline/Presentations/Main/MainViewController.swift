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
  
    init( viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {
        view = MainRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc private func authButtonAction(){

    }
    
    @objc private func appButtonAction(){

    }
}


