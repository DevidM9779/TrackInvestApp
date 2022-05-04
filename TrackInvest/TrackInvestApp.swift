//
//  TrackInvestApp.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 3/17/22.
//

import SwiftUI
import Firebase

@main
struct TrackInvestApp: App {
    
    // initialize Firebase
    init () {
        FirebaseApp.configure()
    }
    
    
    

    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
