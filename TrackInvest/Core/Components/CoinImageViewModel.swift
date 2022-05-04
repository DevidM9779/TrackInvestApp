//
//  CoinImageViewModel.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 5/3/22.
//

import Foundation
import SwiftUI
import Combine


class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = true
    
    private var coin: CryptoModel
    private let dataService : CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CryptoModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
