//
//  FirestoreManager.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 4/18/22.
//

import Foundation
import Firebase

class FirestoreManager: ObservableObject {
    
    @Published var portfolios = [Portfolio]()
    
    init () {
        self.getPortfolios()
    }
    
    // Write a new prtofolio document into firestore
    func createPortfolio(portfolio: Portfolio) {
        
        //
        // Data model that will be uploaded into firestore
        //
        
        let data : [String : Any] = [
            "name": portfolio.name,
            "assets": [
                "stocks": portfolio.stocks,
                "crypto": portfolio.cryptos
            ],
            "dateAdded": Timestamp(date: Date()),
            
        ]
        
//        let historyDocument : [String: Any] = [
//            "portfolioID": "",
//            "bought": "ETH",
//            "spent": 4000,
//            "amountShares": 1.3,
//            "date": Date(),
//        ]
        
        // Initialize firestore's database
        let db = Firestore.firestore()
        
        // create document in the desired firestore collectiom_
        let docRef = db.collection("Portfolios").document(data["name"] as! String)
        
        // set data in firestore's document
        docRef.setData(data, merge: true) { error in
            if let error = error {
                print("Error writing doc: \(error)")
            } else {
                print("Doc succesfully written.")
                self.getPortfolios()
            }
        }
    }
    
    
    // TODO: Implement remove from fs function
    func removePortfolio(portfolio: Portfolio) {
        // remove portfolio from firestore
    }
    
    
    func getPortfolios() {
        print("getting portfolios")
        
        // Get reference to the db
        let db = Firestore.firestore()
        
        // Get all data inside of the collection in firestore
        db.collection("Portfolios").getDocuments { snapshot, error in
            
            // Check for any potential errors first
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    self.portfolios = snapshot.documents.map { doc in
                        let name = doc["name"] as? String ?? "Unnamed"
                        let assets = doc["assets"] as? [String:Dictionary<String, Double>] ?? [:]
                        return Portfolio(name: name,
                                         stocks: assets["stocks"] ?? [:],
                                         cryptos: assets["crypto"] ?? [:])
                    }
                    
                    
                    
                    print("Portfolios: \(self.portfolios)")
                }
            }
        }
    }
    
    
}
