//
//  EachCardView.swift
//  PokerMastermind Watch App
//
//  Created by ryo fujimura on 4/19/24.
//

import SwiftUI

struct EachCardView: View {
    var cardNumber:String
    var body: some View {
        ZStack {
            Image("CardView")
                .resizable()
                .scaledToFit()
                .frame(width: 29)
                .foregroundColor(Color.white)
            Text(cardNumber)
                .foregroundColor(Color.black)
//                .offset(x: -3, y:-2)
        }
    }
}

#Preview {
    EachCardView(cardNumber: "10")
}
