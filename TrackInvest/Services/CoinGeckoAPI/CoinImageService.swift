//
//  CoinImageService.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 5/3/22.
//

import Foundation
import Combine
import SwiftUI


class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private let coin: CryptoModel
    private var imageSubscription: AnyCancellable?
    private let fileManager = LocalFileManager.instance
    private let folderName = "crypto_images"
    private let imageName: String
    
    init(coin: CryptoModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("Retrieved image from cache.")
        } else {
            downloadCoinImage()
            print("Downloading Image...")
        }
            
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
        
        
    }
}
