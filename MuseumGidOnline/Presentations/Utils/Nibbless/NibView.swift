//
//  NibView.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import UIKit

class NibView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable,
                message: "Loading this item from a nib is unsupported in favor of initializer dependency injection."
    )
    required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this item from a nib is unsupported in favor of initializer dependency injection.")
    }
}

