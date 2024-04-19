//
//  ContentView.swift
//  PokerMastermind Watch App
//
//  Created by ryo fujimura on 4/19/24.
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
                        EachCardView(cardNumber: "A").tag(1)
                        EachCardView(cardNumber: "K").tag(13)
                        EachCardView(cardNumber: "Q").tag(12)
                        EachCardView(cardNumber: "J").tag(11)
                    }
                    Group{
                        ForEach((2...10).reversed(), id: \.self) {
                            EachCardView(cardNumber: "\($0)").tag($0)
                           }
                       
                    }
                }
                .labelsHidden()
                .frame(width: 50, height:90)
                Spacer()
                Picker(selection: $cardTwoValue, label: Text("")){
                    Group{
                        EachCardView(cardNumber: "A").tag(1)
                        EachCardView(cardNumber: "K").tag(13)
                        EachCardView(cardNumber: "Q").tag(12)
                        EachCardView(cardNumber: "J").tag(11)
                    }
                    Group{
                        ForEach((2...10).reversed(), id: \.self) {
                            EachCardView(cardNumber: "\($0)").tag($0)
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


#Preview {
    ContentView()
}
