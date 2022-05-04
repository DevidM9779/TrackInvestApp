//
//  PortfolioView.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 3/21/22.
//

import SwiftUI

struct PortfolioView: View {
    var portfolio: Portfolio
    
    var portfolioCoins: [CryptoModel] = []
    @StateObject var pv = PortfolioViewModel()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                HStack (alignment: .center) {
                    
                    List {
                        ForEach(pv.allCoins, id:\.rank) { coin in
                            if portfolio.cryptos?[coin.symbol.uppercased()] != nil {
                                CryptoRowView(coin: coin, showHoldingsCol: false)
                                .padding()
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                        ToolbarItem(placement: .principal) {
                                VStack {
                                    Text(portfolio.name)
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(Color("InvertedBackgroundColor"))
                                }
                        }
                }
                
                Spacer()
                
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView(portfolio: Portfolio(name: "Stocks", stocks: [:], cryptos: [:]))
    }
}
