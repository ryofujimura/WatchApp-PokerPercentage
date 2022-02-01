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
    
    @State var goLight:Bool = false
    @State var firstValue:Int = 0
    @State var secondValue:Int = 0
    @State var percentage:Int = 0
    private let probabilityUnSuite = [[85],
                                      [57,51],
                                      [58,35,55],
                                      [59,36,38,58],
                                      [60,37,39,41,61],
                                      [59,37,39,41,43,64],
                                      [60,37,39,41,43,45,67],
                                      [61,40,40,42,44,46,47,69],
                                      [62,42,43,43,45,47,48,50,72],
                                      [64,44,45,46,47,48,50,52,53,75],
                                      [65,47,48,48,49,50,52,53,55,57,78],
                                      [65,49,50,51,52,53,54,55,57,59,59,80],
                                      [66,53,54,54,55,56,57,58,59,61,62,62,83]]
    private let probabilitySuite = [[85],
                                    [59,51],
                                    [60,39,55],
                                    [61,40,42,58],
                                    [62,41,43,44,61],
                                    [62,40,42,44,46,64],
                                    [63,41,43,45,46,48,67],
                                    [63,43,43,45,47,49,50,69],
                                    [64,45,46,46,48,50,51,53,72],
                                    [64,47,48,49,49,51,53,54,56,75],
                                    [66,50,50,51,52,53,54,56,57,59,78],
                                    [67,52,53,54,55,55,56,58,59,61,61,80],
                                    [68,55,56,57,58,58,59,60,61,63,64,64,83]]
    
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
    
    private let overSeventy = Color(red: 0/256, green: 227/256, blue: 15/256)
    private let overSixty = Color(red: 139/256, green: 238/256, blue: 156/256)
    private let overFifty = Color(red: 252/256, green: 227/256, blue: 154/256)
    private let overFourty = Color(red: 250/256, green: 189/256, blue: 172/256)
    private let overThirty = Color(red: 222/256, green: 71/256, blue: 71/256)
    func ColorPicker() -> Color{
        if Calculate(percentage: percentage,  firstValue: firstValue, secondValue: secondValue) >= 70{
            return overSeventy
        }
        else if Calculate(percentage: percentage,  firstValue: firstValue, secondValue: secondValue) >= 60{
            return overSixty
        }
        else if Calculate(percentage: percentage,  firstValue: firstValue, secondValue: secondValue) >= 50{
            return overFifty
        }
        else if Calculate(percentage: percentage,  firstValue: firstValue, secondValue: secondValue) >= 40{
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
            return String(card)
        }
    }
    
    private let darkGreen = Color(red: 0/256, green: 36/256, blue: 0/256)
    private let darkYellow = Color(red: 55/256, green: 55/256, blue: 0/256)
    private let darkRed = Color(red: 36/256, green: 0/256, blue: 0/256)    
    var body: some View {
        VStack{
            Button(action: {
                suited.toggle()
                if (cardOneValue == cardTwoValue){
                    suited = false
                }
            }) {
                if suited{
                   Text("\(Image(systemName: "suit.spade.fill"))   Suited   \(Image(systemName: "suit.spade.fill"))")
                        .foregroundColor(.white)
                }
                else{
                    Text("\(Image(systemName: "suit.diamond"))  Offsuit  \(Image(systemName: "suit.heart"))")
                        .foregroundColor(.black)
                }
            }
            .background(suited ? Color.orange : Color.gray)
            .frame(width: 130, height: 22, alignment: .center)
            .cornerRadius(100)
            Spacer()
            Button(action: {
                goLight.toggle()
            }) {
                if goLight{
                    Label {
                        Text("\(Calculate(percentage: percentage,  firstValue: firstValue, secondValue: secondValue))%")
                            .font(.title)
                            .foregroundColor(ColorPicker())
                            .offset(x:7)
                    } icon: {
                        ZStack{
                            Circle()
                                .foregroundColor(ColorPicker())
                                .frame(width: 30, height: 30, alignment: .center)
                            if(ColorPicker() == overSeventy ||  ColorPicker() == overSixty){
                                Text("💰")
                                    .font(.title3)
                            } else if (ColorPicker() == overFifty){
                                Text("💵")
                                    .font(.title3)
                            } else {
                                Text("💸")
                                    .font(.title3)
                            }
                        }
                    }
                }
                else{
                    HStack{
                        if(ColorPicker() == overSeventy ||  ColorPicker() == overSixty){
                            ZStack{
                                Image(systemName: "circle.fill")
                                    .foregroundColor(ColorPicker())
                                Text("💰")
                                    .font(.title3)
                            }
                            Image(systemName: "circle.fill")
                                .foregroundColor(darkYellow)
                            Image(systemName: "circle.fill")
                                .foregroundColor(darkRed)
                        } else if (ColorPicker() == overFifty){
                            Image(systemName: "circle.fill")
                                .foregroundColor(darkGreen)
                            ZStack{
                                Image(systemName: "circle.fill")
                                    .foregroundColor(ColorPicker())
                                Text("💵")
                                    .font(.title3)
                            }
                            Image(systemName: "circle.fill")
                                .foregroundColor(darkRed)
                        } else {
                            Image(systemName: "circle.fill")
                                .foregroundColor(darkGreen)
                            Image(systemName: "circle.fill")
                                .foregroundColor(darkYellow)
                            ZStack{
                                Image(systemName: "circle.fill")
                                    .foregroundColor(ColorPicker())
                                Text("💸")
                                    .font(.title3)
                            }
                        }
                    }
                    .font(.title)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .offset(x:0, y:25)
        }
        
    }
}



struct CalculateView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CalculateView(cardOneValue: 1, cardTwoValue: 1)
        }
    }
}
