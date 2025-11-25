//
//  UIStackView+AddArrangedSubviews.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview(_:))
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview(_:))
    }
}

