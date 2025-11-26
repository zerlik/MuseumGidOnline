//
//  ListCardsViewModel.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import Foundation
import Combine
import NetworkKIT

protocol ListCardsViewModelProtocol: AnyObject {
    var router: ListCardsRouterProtocol?{get set}
    var citiesPublisher: AnyPublisher<[City], Never> { get }
    func loadCities()
    func goToNextScreen(_ city: City)
}

@MainActor
final class ListCardsViewModel: ListCardsViewModelProtocol, ObservableObject {
    
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
    
    func goToNextScreen(_ city: City) {
        print("Selected city: \(city.name) (id: \(city.id))")
    }
    
    func loadCities() {
        isLoading = true
        
        let mockCities = [
            City(id: "1", name: "Москва"),
            City(id: "2", name: "Санкт-Петербург"),
            City(id: "3", name: "Казань"),
            City(id: "4", name: "Екатеринбург"),
            City(id: "5", name: "Новосибирск")
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.cities = mockCities
            self?.isLoading = false
        }
    }
}

