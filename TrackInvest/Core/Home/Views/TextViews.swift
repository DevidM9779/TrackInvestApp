//
//  TextViews.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 3/27/22.
//

import SwiftUI

struct BigBoldTextView: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .kerning(1.0)
            .foregroundColor(Color("InvertedBackgroundColor"))
            .font(.title2)
            .fontWeight(.black)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        BigBoldTextView(text: "Portfolios")
    }
}
