//
//  ReelsViewModel.swift
//  MuseumGidOnline
//
//  Created by andrew on 01.12.25.
//

import Foundation
import Combine
import NetworkKIT

protocol ReelsViewModelProtocol: AnyObject {
    
}

@MainActor
final class ReelsViewModel: ReelsViewModelProtocol, ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    
    var router: ListCardsRouterProtocol?
    private let service: NetworkProvider
    
    @Published var cities: [City] = []
    @Published var isLoading: Bool = false
    
    var citiesPublisher: AnyPublisher<[City], Never> {
        $cities.eraseToAnyPublisher()
    }
    
    init(service: NetworkProvider) {
        self.service = service
    }
}

