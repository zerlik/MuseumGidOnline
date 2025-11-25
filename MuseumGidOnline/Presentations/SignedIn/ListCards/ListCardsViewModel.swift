//
//  ListCardsViewModel.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import Foundation
import Combine

protocol ListCardsViewModelProtocol: AnyObject {
}

final class ListCardsViewModel: ListCardsViewModelProtocol  {
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
       
        
    }
    
    deinit {
 
    }
}




