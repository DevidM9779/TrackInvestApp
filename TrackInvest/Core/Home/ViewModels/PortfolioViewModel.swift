//
//  PortfolioViewModel.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 5/2/22.
//

import Foundation
import Combine

class PortfolioViewModel: ObservableObject {
    
    @Published var allCoins: [CryptoModel] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    
}
