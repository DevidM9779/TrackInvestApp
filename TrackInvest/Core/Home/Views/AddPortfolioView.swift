//
//  AddPortfolioView.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 4/18/22.
//

import SwiftUI

struct AddPortfolioView: View {
    @Binding var alertIsVisible: Bool
        
    @State var name = ""
    
    var fm = FirestoreManager()
    
    @State private var stocksOn = false
    @State private var cryptoOn = false
    
    @State var stocks = [String]()
    @State var cryptos = [String]()
        
    @State var stocksQ = [String]()
    @State var cryptosQ = [String]()

    
    func getStocksBinding(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { stocks[index] },
                               set: { stocks[index] = $0 })
    }
    func getCryptosBinding(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { cryptos[index] },
                               set: { cryptos[index] = $0 })
    }
    func getStocksQBinding(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { stocksQ[index] },
                               set: { stocksQ[index] = $0 })
    }
    func getCryptosQBinding(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { cryptosQ[index] },
                               set: { cryptosQ[index] = $0 })
    }
    

    func resetCryptos() {
        cryptos = []
        cryptosQ = []
    }
    func resetStocks() {
        stocks = []
        stocksQ = []
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    
                    // First section for NAME and VALUE of portfolio
                    Section {
                        TextField("Name", text: $name)
                            .keyboardType(.decimalPad)
                    }
                    
                    // Second section for Stocks inside portfolio
                    Section(footer: Text("Add stocks to your portfolio")) {
                        
                        Toggle("Stocks", isOn: $stocksOn)
                            .toggleStyle(SwitchToggleStyle(tint: Color("BlueColor")))
                        
                        if stocksOn {
                            ForEach(0..<stocks.count, id: \.self) { index in
                                HStack {
                                    Button(action: {
                                        stocks.remove(at: index)
                                        stocksQ.remove(at: index)
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(.red)
                                            .padding(.horizontal)
                                        }
                                    HStack {
                                        TextField("Stock Symbol", text: getStocksBinding(forIndex: index))
                                        Spacer()
                                        TextField("Quantity", text: getStocksQBinding(forIndex: index))
                                            .keyboardType(.decimalPad)
                                    }
                                    
                                }
                            }
                            
                            Button(action: {
                                stocks.append("")
                                stocksQ.append("")
                            })
                            {
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.green)
                                        .padding(.horizontal)
                                    Text("Add stock")
                                }
                            }
                        }
                    }
                    
                    // Third section for Cryptos in portfolio
                    Section(footer: Text("Add crypto to your portfolio")) {
                        
                        Toggle("Crypto", isOn: $cryptoOn)
                            .toggleStyle(SwitchToggleStyle(tint: Color("BlueColor")))
                            
                        
                        if cryptoOn {
                            ForEach(0..<cryptos.count, id: \.self) { index in
                                HStack {
                                    Button(action: {
                                        cryptos.remove(at: index)
                                        cryptosQ.remove(at: index)
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(.red)
                                            .padding(.horizontal)
                                        }
                                    HStack {
                                        TextField("Crypto Symbol", text: getCryptosBinding(forIndex: index))
                                        Spacer()
                                        TextField("Quantity", text: getCryptosQBinding(forIndex: index))
                                            .keyboardType(.decimalPad)
                                    }
                                    
                                }
                            }
                            
                            Button(action: {
                                cryptos.append("")
                                cryptosQ.append("")
                            })
                            {
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.green)
                                        .padding(.horizontal)
                                    Text("Add crypto")
                                }
                            }
                        }
                
                    }
                }
                
                
                
                // CREATE button -> it will create a portfolio and upload it into firestore
                Button(action: {
                    
                    var stocksData : [String:Double] = [:]
                    for i in 0..<stocks.count {
                        stocksData[stocks[i]] = Double(stocksQ[i])
                    }
                    var cryptosData : [String:Double] = [:]
                    for i in 0..<cryptos.count {
                        cryptosData[cryptos[i]] = Double(cryptosQ[i])
                    }
                    
                    fm.createPortfolio(portfolio: Portfolio(name: name, stocks: stocksData, cryptos: cryptosData))
                    alertIsVisible = false
                    
                }) {
                    Text("Create")
                        .frame(width: 250, height: 50, alignment: .center)
                        .background(Color("BlueColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                .padding()
                
                
            }
            .background(Color(uiColor: UIColor.systemGray6))
            .navigationTitle("Create Portfolio")
        }
    }
}

struct AddPortfolioView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    
    
    static var previews: some View {
        AddPortfolioView(alertIsVisible: alertIsVisible)
    }
}
