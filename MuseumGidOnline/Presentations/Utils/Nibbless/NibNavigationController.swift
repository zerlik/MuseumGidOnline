//
//  NibNavigationController.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import UIKit

class NibNavigationController: UINavigationController {
    
    init() { super.init(nibName: nil, bundle: nil) }
    
    @available(*, unavailable,
                message: "Loading this item from a nib is unsupported in favor of initializer dependency injection."
    )
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable,
                message: "nib is unsupported in favor of initializer dependency injection."
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("nib is unsupported in favor of initializer dependency injection.")
    }
}

