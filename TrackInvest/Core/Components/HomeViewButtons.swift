//
//  AddPortfolioBtn.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 3/25/22.
//

import SwiftUI

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
                )
            
        }
    }
}

struct AddPortfolioBtn_Previews: PreviewProvider {
    static var previews: some View {
        AddPortfolioBtn()
    }
}
