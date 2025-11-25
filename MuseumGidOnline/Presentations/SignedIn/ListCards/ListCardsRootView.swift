//
//  ListCardsRootView.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import UIKit
import SnapKit

final class ListCardsRootView: NibView {
    
    private let viewModel: ListCardsViewModelProtocol
    
//    private let mainStackView = UIStackView(axis: .vertical)
//    private let loadingImage = UIImageView(image: AssetManager.Auth.logo)
    
    private var activityView = UIActivityIndicatorView(style: .large)
    
    init(viewModel: ListCardsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        constructHierarchy()
        activateConstraints()
        style()
    }
}

private extension ListCardsRootView {
    
    private func constructHierarchy() {
//        addSubviews(mainStackView, activityView)
//        mainStackView.addArrangedSubviews(
//            loadingImage
//        )
    }
    
    func activateConstraints() {
//        mainStackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        activityView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
    }
    
    func style() {
        backgroundColor = .red
//        mainStackView.backgroundColor = .clear
//        loadingImage.backgroundColor = .clear
//        loadingImage.contentMode = .scaleAspectFit
        activityView.startAnimating()
    }
}



