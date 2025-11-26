//
//  ListCardsViewController.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import UIKit
import SwiftUI
import NetworkKIT

protocol ListCardsControllerProtocol: AnyObject {
   
}

final class ListCardsViewController: NibViewController {
    
    private let viewModel: ListCardsViewModelProtocol
    
    init( viewModel: ListCardsViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    private var hostingController: UIHostingController<ListCardView>?
    
    override func loadView() {
        guard let viewModel = viewModel as? ListCardsViewModel else {
            fatalError("viewModel must be instance of ListCardsViewModel")
        }
        
        let swiftUIView = ListCardView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: swiftUIView)
        self.hostingController = hostingController
        hostingController.view.backgroundColor = .systemBackground
        
        view = UIView()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let hostingController = hostingController else { return }
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
    }
}

extension MainViewController: MainViewControllerProtocol {
    
}

