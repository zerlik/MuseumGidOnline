//
//  MainViewModel.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import Foundation
import Combine

protocol MainViewModelProtocol: AnyObject {
}

final class MainViewModel: MainViewModelProtocol  {
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
       
        
    }
    
    deinit {
 
    }
}



