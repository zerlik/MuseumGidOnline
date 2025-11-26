//
//  MainRootView.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import UIKit
import SnapKit

final class MainRootView: NibView {
    
    private let viewModel: MainViewModelProtocol
    
    private let mainStackView = UIStackView(axis: .vertical)
    private let loadingImage = UIImageView(image: AssetManager.Main.logo)
    
    private var activityView = UIActivityIndicatorView(style: .large)
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        constructHierarchy()
        activateConstraints()
        style()
        loadUserSession()
    }
}

private extension MainRootView {
    
    private func constructHierarchy() {
        addSubviews(mainStackView, activityView)
        mainStackView.addArrangedSubviews(
            loadingImage
        )
    }
    
    func activateConstraints() {
        activityView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func style() {
        backgroundColor = .blueBG
        mainStackView.backgroundColor = .clear
        loadingImage.contentMode = .scaleAspectFit
        activityView.startAnimating()
    }
    
    private func loadUserSession() {
        viewModel.loadUserSession()
    }
}


