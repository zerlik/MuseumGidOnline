//
//  ReelsBuilder.swift
//  MuseumGidOnline
//
//  Created by andrew on 01.12.25.
//

import UIKit
import NetworkKIT

final class ReelsBuilder: Builders {
    
    func makeVC(_ dependencies: Dependencies) -> NibViewController {
        let service: NetworkProvider = dependencies.service
        let viewModel: ReelsViewModelProtocol = ReelsViewModel(service: service)
        let view = ReelsViewController(viewModel: viewModel)
        
        view.modalPresentationStyle = .fullScreen
        return view
    }
}
