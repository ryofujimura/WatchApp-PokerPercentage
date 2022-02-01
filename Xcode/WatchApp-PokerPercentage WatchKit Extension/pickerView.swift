//
//  pickerView.swift
//  WatchApp-PokerPercentage
//
//  Created by ryo fuj on 1/31/22.
//

import SwiftUI

struct pickerView: View {
    @State var cardOneValue = 1
    @State var cardTwoValue = 1
    
    var body: some View {
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
    }
}

struct pickerView_Previews: PreviewProvider {
    static var previews: some View {
        pickerView()
    }
}
