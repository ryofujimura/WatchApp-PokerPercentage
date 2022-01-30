//
//  eachCardView.swift
//  WatchApp-PokerPercentage WatchKit Extension
//
//  Created by ryo fuj on 1/30/22.
//

import SwiftUI

struct eachCardView: View {
    var cardNumber:String
    
    var body: some View {
        ZStack {
            Image(systemName: "rectangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 27)
                .foregroundColor(Color("CardBackgorund"))
                .overlay(
                        RoundedRectangle(cornerRadius: 3)
                        .stroke(lineWidth: 1)
                    )
            HStack{
                Text(cardNumber)
                    .foregroundColor(Color.white)
                    .offset(x: 1, y: -2)
                    .font(.system(size: 20))
                Text(cardNumber)
                    .foregroundColor(Color.white)
                    .offset(x: -1, y: 3)
                    .font(.system(size: 13))
            }
        }
    }
}

struct eachCardView_Previews: PreviewProvider {
    static var previews: some View {
        eachCardView(cardNumber: "A")
    }
}
