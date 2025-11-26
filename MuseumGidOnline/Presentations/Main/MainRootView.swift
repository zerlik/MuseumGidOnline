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
    }
}

private extension MainRootView {
    
    private func constructHierarchy() {
        addSubviews(activityView)
//        mainStackView.addArrangedSubviews(
//            loadingImage
//        )
    }
    
    func activateConstraints() {
//        mainStackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
        activityView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func style() {
//        backgroundColor = .blueBG
//        mainStackView.backgroundColor = .blueBG
//        loadingImage.backgroundColor = .gray
//        loadingImage.contentMode = .scaleAspectFit
        activityView.startAnimating()
    }
}


