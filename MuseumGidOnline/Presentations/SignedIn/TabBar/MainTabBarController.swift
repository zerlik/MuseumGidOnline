//
//  MainTabBarController.swift
//  MuseumGidOnline
//
//  Created by andrew on 01.12.25.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init(nibName: nil, bundle: nil)
        setupTabs()
        configureAppearance()
    }
    
    @available(*, unavailable,
               message: "Use init(dependencies:) instead.")
    required init?(coder: NSCoder) {
        fatalError("Use init(dependencies:) instead.")
    }
}

private extension MainTabBarController {
    
    func setupTabs() {
        let audioGuideVC = ListCardsBuilder().makeVC(dependencies)
        audioGuideVC.title = "Музейный аудиогид"
        audioGuideVC.tabBarItem = UITabBarItem(
            title: "Аудиогид",
            image: UIImage(systemName: "headphones"),
            selectedImage: UIImage(systemName: "headphones")
        )
        
        let reelsVC = ReelsBuilder().makeVC(dependencies)
        reelsVC.title = "Рилс"
        reelsVC.tabBarItem = UITabBarItem(
            title: "Рилс",
            image: UIImage(systemName: "play.rectangle"),
            selectedImage: UIImage(systemName: "play.rectangle.fill")
        )
        
        viewControllers = [
            audioGuideVC,
            reelsVC
        ]
    }
    
    func configureAppearance() {
        tabBar.isTranslucent = true
    }
}


