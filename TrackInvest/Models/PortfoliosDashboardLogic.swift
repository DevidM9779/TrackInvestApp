//
//  PortfoliosDashboardLogic.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 4/18/22.
//

import Foundation

class PortfoliosDashboardLogic: ObservableObject {
    @Published private(set) var portfolios: [Portfolio] = []
    
    func getPortfolios() {
        // read from firestore
    }
    
    func addPortfolio(portfolio: Portfolio) {
        portfolios.append(portfolio)
    }
    
    func removePortfolio(portfolio: Portfolio) {
        portfolios = portfolios.filter { $0.name != portfolio.name }
    }
}
