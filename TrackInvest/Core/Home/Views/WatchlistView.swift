//
//  WatchlistView.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 3/27/22.
//

import SwiftUI

struct WatchlistView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 10) {
                
                NavigationView {
                    ScrollView {
                        ForEach(watchlist, id:\.name) { stock in
                            NavigationLink(destination: StockView(), label: {
                                stockPreview(stock: stock)
                                    .padding(.top, 20)
                            })
                        }
                        .padding(.top, 50)
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(content: {
                        ToolbarItem(placement: .principal) {
                            
                            HStack (alignment: .center) {
                                
                                XMarkButton
                                
                                Spacer()
                                
                                BigBoldTextView(text: "Watchlist")
                                    .padding(.trailing, 35)
                                Spacer()
                            }
                            
                        }
                    })
                }
    
            }
        }
    }
}


var watchlist : [StockModel] = [

    StockModel(name: "Ethereum", symbol: "ETH", value: 3278.86, purchasesHistory: [] ),
    StockModel(name: "Nio", symbol: "NIO", value: 47.23, purchasesHistory: [] ),
    StockModel(name: "Dogecoin", symbol: "DOGE", value: 0.1344, purchasesHistory: [] )
    
]


struct stockPreview: View {
    let stock: StockModel
    
    var body: some View {
        ZStack {
            
            HStack {
                VStack (alignment: .leading) {
                    
                    Text(stock.name)
                        .bold()
                        .font(.title2)
                        .foregroundColor(.black)
                    
                    Text(stock.symbol)
                        .font(.body)
                        .foregroundColor(.black)
                    
                }
                .padding(.leading)
                
                Spacer()
                
                VStack (alignment: .trailing) {
                    Text("$\(stock.value, specifier: "%.2f")")
                        .font(.title3)
                        .foregroundColor(.black)

                    Text("+25.00%")
                        .foregroundColor(Color("GreenColor"))
                }
                .padding(.trailing)
                
            }
        }
    }
}


struct WatchlistView_Previews: PreviewProvider {
    static private var watchlistShowing = Binding.constant(false)
    
    static var previews: some View {
        WatchlistView()
    }
}

extension WatchlistView {
    private var XMarkButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
}
