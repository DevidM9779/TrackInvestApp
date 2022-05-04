//
//  PortfolioButton.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 3/17/22.
//

import SwiftUI

struct PortfolioButton: View {
    var portfolio: Portfolio
    
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: 21.0)
//                .stroke(Color("AccentColor"))
//                .foregroundColor(Color("BackgroundColor"))
//                .opacity(0.3)
//                .frame(width: 340, height: 100)
                
            
            HStack {
                Text(portfolio.name)
                    .bold()
                    .font(.title2)
                    .padding(.leading)
                    .foregroundColor(Color("PortfolioBtnTitle"))
                
                
                Spacer()
                
                VStack {
                    Text("31547.00$")
                        .font(.title2)
                        .padding(.trailing, 25)
                        .foregroundColor(.black)

                    
                    Text("+25.00%")
                        .padding(.trailing, -10)
                        .foregroundColor(Color("GreenColor"))
                }
                
            }
        }
        .frame(height:100)
    }
}

struct PortfolioButton_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioButton(portfolio: Portfolio(name: "Stocks"))
            .previewLayout(.sizeThatFits)
    }
}
