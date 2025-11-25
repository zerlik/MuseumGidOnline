//
//  AppCustomization.swift
//  MuseumGidOnline
//
//  Created by andrew on 24.11.25.
//

import UIKit

final class AppCustomization {
    
    init() {
        
        customizeNavigationBar()
        customizeTabBar()
    }
}

private extension AppCustomization {
    func customizeNavigationBar() {
        let navBarProxy = UINavigationBar.appearance()
        navBarProxy.tintColor = .black
    }
    
    func customizeTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().tintColor = .clear
    }
}

