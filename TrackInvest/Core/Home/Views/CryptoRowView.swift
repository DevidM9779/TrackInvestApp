//
//  CoinRowView.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 4/10/22.
//

import SwiftUI

struct CryptoRowView: View {
    
    let coin: CryptoModel
    let showHoldingsCol: Bool
    
    var body: some View {
        ZStack {
            
            HStack {
                
                leftCol
                
                Spacer()
                if showHoldingsCol {
                    centerCol
                }
                
                rightCol
                
            }
            .font(.subheadline)
        }
        
    }
}

struct CryptoRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CryptoRowView(coin: dev.coin, showHoldingsCol: true)
                .previewLayout(.sizeThatFits)
            CryptoRowView(coin: dev.coin, showHoldingsCol: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)

        }
    }
}


extension CryptoRowView {
    private var leftCol : some View {
        HStack {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color("SecondaryTextColor"))
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
        }
    } 
    
    private var centerCol : some View {
        VStack (alignment: .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color("InvertedBackgroundColor"))
    }
    
    private var rightCol : some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color("InvertedBackgroundColor"))
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .bold()
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color("GreenColor") : Color("RedColor")
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
