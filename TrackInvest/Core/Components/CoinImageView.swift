//
//  CoinImageView.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 5/3/22.
//

import SwiftUI


struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CryptoModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color("SecondaryTextColor"))
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
