//
//  UIStackView+Init.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import UIKit

extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0,
        alignment: Alignment = .fill,
        distribution: Distribution = .fill
    ) {
        self.init()
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
}

