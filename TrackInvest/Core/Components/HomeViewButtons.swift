//
//  AddPortfolioBtn.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 3/25/22.
//

import SwiftUI

struct HeartButton: View {
    var body: some View {
        
        Image(systemName: "heart.fill")
            .foregroundColor(Color("SecondaryTextColor"))
            .font(.system(size: 15))

    }
}

struct SettingsButton: View {
    var body: some View {
        
        Image(systemName: "line.3.horizontal.decrease")
            .foregroundColor(Color("SecondaryTextColor"))
            .font(.system(size: 20))
            
        
    }
}

struct AddPortfolioBtn: View {
    var body: some View {
        ZStack {
            
            Image(systemName: "plus")
                .foregroundColor(.white)
                .font(.system(size: 35))
                .background(
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color("AccentColor"))
                        .opacity(0.80)
                ).frame(width: 70, height: 70)
            
        }
    }
}

struct HomeViewButtons_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton().previewLayout(.sizeThatFits)
        HeartButton().previewLayout(.sizeThatFits)
        AddPortfolioBtn().previewLayout(.sizeThatFits)
    }
}
