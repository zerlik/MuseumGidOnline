//
//  AuthViewController.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import UIKit
import SwiftUI
import NetworkKIT

protocol AuthViewControllerProtocol: AnyObject {
    
}

final class AuthViewController: NibViewController {
    
    private let viewModel: AuthViewModelProtocol
    
    init(viewModel: AuthViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    private var hostingController: UIHostingController<AuthView>?
    
    override func loadView() {
        guard let viewModel = viewModel as? AuthViewModel else {
            fatalError("viewModel must be instance of AuthViewModel")
        }
        
        let swiftUIView = AuthView(viewModel: viewModel, presentingViewController: self)
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

extension AuthViewController: AuthViewControllerProtocol {
    
}



