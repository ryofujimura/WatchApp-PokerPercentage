//
//  ContentView.swift
//  WatchApp-PokerPercentage WatchKit Extension
//
//  Created by ryo fuj on 1/30/22.
//

import SwiftUI

struct ContentView: View {
    @State var secondScreenShown = false
    @State var cardOneValue = 1
    @State var cardTwoValue = 1
    
    var body: some View {
        VStack {
            Spacer()
                .padding(.top)
            Text("Winning %?")
                .padding(.top)
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
                .frame(width: 50, height:100)
                
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
                .frame(width: 50, height:100)
                Spacer()
            }
            CalculateView(cardOneValue: cardOneValue, cardTwoValue: cardTwoValue)
            .padding(.vertical)
        }
    }
}
//struct CalculatePercentage {
//    var cardOne:Int
//    var cardTwo:Int
//    var percentage:Int
//
//    var cardOne = $cardOneValue.tag
//    cardTwo = $cardTwoValue
//
//    if(cardOne = cardTwo){
//        return "85%"
//    }
//
//}
//
//























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
