//
//  HomeViewModel.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 4/11/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var stocksWatchlist : [StockModel] = []
    @Published var cryptoWatchlist : [CryptoModel] = []
    @Published var portfolios : [Portfolio] = []
    
    private var fireManager = FirestoreManager()
    private let dataService = CoinDataService()
    
    
    init() {
        
    }
    
    
    
}
