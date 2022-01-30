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
            Text("Winning %?")
                .padding(.bottom)
            HStack {
                Spacer()
                Picker(selection: $cardOneValue, label: Text("")){
                    Group{
                        Text("A").tag(1)
                        Text("K").tag(13)
                        Text("Q").tag(12)
                        Text("J").tag(11)
                    }
                    Group{
                        Text("10").tag(10)
                        Text("9").tag(9)
                        Text("8").tag(8)
                        Text("7").tag(7)
                        Text("6").tag(6)
                        Text("5").tag(5)
                        Text("4").tag(4)
                        Text("3").tag(3)
                        Text("2").tag(2)
                    }
                }
                .frame(width: 54, height:100)
                Spacer()
                Picker(selection: $cardTwoValue, label: Text("")){
                    Group{
                        Text("A").tag(1)
                        Text("K").tag(13)
                        Text("Q").tag(12)
                        Text("J").tag(11)
                    }
                    Group{
                        Text("10").tag(10)
                        Text("9").tag(9)
                        Text("8").tag(8)
                        Text("7").tag(7)
                        Text("6").tag(6)
                        Text("5").tag(5)
                        Text("4").tag(4)
                        Text("3").tag(3)
                        Text("2").tag(2)
                    }
                }
                .frame(width: 54, height:100)
                Spacer()
            }
            Label {
                Text("\(cardOneValue)")
                    .font(.body)
                    .foregroundColor(.primary)
            } icon: {
                Circle()
                    .frame(width: 34, height: 24, alignment: .center)
            }
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
