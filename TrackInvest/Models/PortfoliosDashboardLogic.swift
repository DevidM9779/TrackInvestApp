//
//  PortfoliosDashboardLogic.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 4/18/22.
//

import Foundation

class PortfoliosDashboardLogic: ObservableObject {
    
    @Published private(set) var portfolios: [Portfolio] = []
    private var fireManager = FirestoreManager()
    
    func getPortfolios() {
        // Retrive data from db
        fireManager.getPortfolios()
        // local portfolios retrieved
        portfolios = fireManager.portfolios
    }
    
    func addPortfolio(portfolio: Portfolio) {
        // Add locally in the app
        portfolios.append(portfolio)
        // Add to the db
        fireManager.createPortfolio(portfolio: portfolio)
    }
    
    func removePortfolio(portfolio: Portfolio) {
        // locally remove from the app
        portfolios = portfolios.filter { $0.name != portfolio.name }
        // remove from the db
        fireManager.removePortfolio(portfolio: portfolio)
    }
    
}
