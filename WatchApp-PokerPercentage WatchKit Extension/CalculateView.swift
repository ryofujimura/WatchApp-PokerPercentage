//
//  CalculateView.swift
//  WatchApp-PokerPercentage WatchKit Extension
//
//  Created by ryo fuj on 1/30/22.
//

import SwiftUI

struct CalculateView: View {
    public var cardOneValue:Int
    public var cardTwoValue:Int
    
    @State private var percentage:Int = 0
    @State private var cardOneAlphabet:String?
    @State private var cardTwoAlphabet:String?
    @State private var skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    func Calculate() -> Int{
        if (cardOneValue == 1 && cardTwoValue == 1){
            return 85
        }
        return 0
    }
    
    var body: some View {
        Label {
            Text("\(cardOneValue) + \(cardTwoValue) = \(Calculate())%")
                .font(.body)
                .foregroundColor(.primary)
        } icon: {
            Circle()
                .frame(width: 34, height: 24, alignment: .center)
                .foregroundStyle(skyBlue)
        }
        .padding(.vertical)
    }
}



struct CalculateView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Text("Hello, World!")
            CalculateView(cardOneValue: 2, cardTwoValue: 1)
        }
    }
}
