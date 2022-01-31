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
    @State var suited:Bool = false
    
    @State var firstValue:Int = 0
    @State var secondValue:Int = 0
    @State var percentage:Int = 0
    private let probabilityUnSuite = [[85],
                                      [59,51],
                                      [60,35,55],
                                      [61,36,38,58],
                                      [62,37,39,41,61],
                                      [62,37,39,41,43,64],
                                      [63,37,39,41,43,45,67],
                                      [63,40,40,42,44,46,47,69],
                                      [64,42,43,43,45,47,48,50,72],
                                      [66,44,45,46,47,48,50,52,53,75],
                                      [66,47,48,48,49,50,52,53,55,57,78],
                                      [67,49,50,51,52,53,54,55,57,59,59,80],
                                      [68,53,54,54,55,56,57,58,59,61,62,62,83]]
    private let probabilitySuite = [[0],
                                    [64,0],
                                    [61,64,0],
                                    [59,61,63,0],
                                    [56,57,59,61,0],
                                    [53,54,56,58,60,0],
                                    [50,51,53,54,56,59,0],
                                    [48,49,50,51,53,55,58,0],
                                    [46,46,47,48,49,52,55,58,0],
                                    [44,44,45,45,46,49,51,54,57,0],
                                    [42,43,42,43,43,46,48,50,53,56,0],
                                    [39,40,41,40,41,43,45,47,50,52,55,0],
                                    [57,58,59,60,59,60,61,62,64,65,65,66,0]]
    
    func Calculate(percentage : Int, firstValue:Int, secondValue:Int) -> Int{
        var percentage = percentage
        var firstValue = firstValue
        var secondValue = secondValue
        
        if (cardOneValue < cardTwoValue){
            firstValue = cardTwoValue
            secondValue = cardOneValue
        } else {
            firstValue = cardOneValue
            secondValue = cardTwoValue
        }
       if suited{
            percentage = probabilitySuite[firstValue-1][secondValue-1]
        }
        else{
            percentage = probabilityUnSuite[firstValue-1][secondValue-1]
        }
        return percentage
    }
    
    private let overSeventy = Color(red: 44/256, green: 142/256, blue: 78/256)
    private let overSixty = Color(red: 139/256, green: 238/256, blue: 156/256)
    private let overFifty = Color(red: 252/256, green: 227/256, blue: 154/256)
    private let overFourty = Color(red: 250/256, green: 189/256, blue: 172/256)
    private let overThirty = Color(red: 222/256, green: 71/256, blue: 71/256)
    func ColorPicker() -> Color{
        if Calculate(percentage: percentage,  firstValue: firstValue, secondValue: secondValue) > 70{
            return overSeventy
        }
        else if Calculate(percentage: percentage,  firstValue: firstValue, secondValue: secondValue) > 60{
            return overSixty
        }
        else if Calculate(percentage: percentage,  firstValue: firstValue, secondValue: secondValue) > 50{
            return overFifty
        }
        else if Calculate(percentage: percentage,  firstValue: firstValue, secondValue: secondValue) > 40{
            return overFourty
        }
        else{
            return overThirty
        }
    }
    
//    @State var card:Int = ""
    func ConvertToAlphabet(card: Int) -> String{
//        var card = card
        if (card == 1){
            return "A"
        } else if (card == 13){
            return "K"
        }
        else if (card == 12){
            return "Q"
        }
        else if (card == 11){
            return "J"
        }
        else{
            return String(cardOneValue)
        }
    }
    var body: some View {
        Label {
            Text("\(ConvertToAlphabet(card:cardOneValue)) + \(ConvertToAlphabet(card:cardTwoValue)) = \(Calculate(percentage: percentage,  firstValue: firstValue, secondValue: secondValue))%")
                .font(.body)
                .foregroundColor(.primary)
        } icon: {
            Circle()
                .frame(width: 34, height: 24, alignment: .center)
                .foregroundStyle(ColorPicker())
        }
        .padding(.vertical)
    }
}



struct CalculateView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Text("Hello, World!")
            CalculateView(cardOneValue: 1, cardTwoValue: 12)
        }
    }
}
