//
//  ReelsViewController.swift
//  MuseumGidOnline
//
//  Created by andrew on 01.12.25.
//

import UIKit
import SwiftUI

final class ReelsViewController: NibViewController {
    
    private let viewModel: ReelsViewModelProtocol
    private var hostingController: UIHostingController<AnyView>?
    
    init(viewModel: ReelsViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func loadView() {

        
        view = UIView()
        view.backgroundColor = .yellow
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


