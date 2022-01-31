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
    
    @State var percentage:Int = 0
    private let probabilityUnSuite = [[85],[59,51],[60,35,55],[61,36,38,58],[62,37,39,41,61],[62,37,39,41,43,64],[63,37,39,41,43,45,67],[63,40,40,42,44,46,47,69],[64,42,43,43,45,47,48,50,72],[66,44,45,46,47,48,50,52,53,75],[66,47,48,48,49,50,52,53,55,57,78],[67,49,50,51,52,53,54,55,57,59,59,80],[68,53,54,54,55,56,57,58,59,61,62,62,83]]
    private let probabilitySuite = [[57,58,59,60,59,60,61,62,64,65,65,66],[39,40,41,40,41,43,45,47,50,52,55],[42,43,42,43,43,46,48,50,53,56],[44,44,45,45,46,49,51,54,57],[46,46,47,48,49,52,55,58],[48,49,50,51,53,55,58],[50,51,53,54,56,59],[53,54,56,58,60],[56,57,59,61],[59,61,63],[61,64],[64]]
    func Calculate(percentage : Int) -> Int{
        var percentage = percentage
        
        percentage = probabilitySuite[12][0]
        return percentage
    }
    
    @State private var cardOneAlphabet:String?
    @State private var cardTwoAlphabet:String?
    private let overSeventy = Color(red: 44/256, green: 142/256, blue: 78/256)
    private let overSixty = Color(red: 149/256, green: 198/256, blue: 166/256)
    private let overFifty = Color(red: 252/256, green: 227/256, blue: 154/256)
    private let overFourty = Color(red: 250/256, green: 189/256, blue: 172/256)
    private let overThirty = Color(red: 222/256, green: 71/256, blue: 71/256)
//    func ColorPicker() -> Color{
//    func ConvertToAlphabet() -> String{
    var body: some View {
        Label {
            Text("\(cardOneValue) + \(cardTwoValue) = \(Calculate(percentage: percentage))%")
                .font(.body)
                .foregroundColor(.primary)
        } icon: {
            Circle()
                .frame(width: 34, height: 24, alignment: .center)
                .foregroundStyle(overSixty)
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
