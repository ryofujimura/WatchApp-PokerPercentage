//
//  ContentView.swift
//  PokerPercentage WatchKit Extension
//
//  Created by ryo fuj on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    @State var cardOneValue = 1
    @State var cardTwoValue = 1
//    @State var suited:Bool = false

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Picker(selection: $cardOneValue, label: Text("")){
                    Group{
                        eachCardView(cardNumber: "A").tag(1)
                        eachCardView(cardNumber: "K").tag(13)
                        eachCardView(cardNumber: "Q").tag(12)
                        eachCardView(cardNumber: "J").tag(11)
                    }
                    Group{
                        ForEach((2...10).reversed(), id: \.self) {
                            eachCardView(cardNumber: "\($0)").tag($0)
                           }
                       
                    }
                }
                .labelsHidden()
                .frame(width: 50, height:90)
                Spacer()
                Picker(selection: $cardTwoValue, label: Text("")){
                    Group{
                        eachCardView(cardNumber: "A").tag(1)
                        eachCardView(cardNumber: "K").tag(13)
                        eachCardView(cardNumber: "Q").tag(12)
                        eachCardView(cardNumber: "J").tag(11)
                    }
                    Group{
                        ForEach((2...10).reversed(), id: \.self) {
                            eachCardView(cardNumber: "\($0)").tag($0)
                           }
                    }
                }
                .labelsHidden()
                .frame(width: 50, height:90)
                Spacer()
            }
            .offset(y:8)
            CalculateView(cardOneValue: cardOneValue, cardTwoValue: cardTwoValue)
        }
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
