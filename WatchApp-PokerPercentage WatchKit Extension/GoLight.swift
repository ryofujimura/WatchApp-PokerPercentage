//
//  GoLight.swift
//  WatchApp-PokerPercentage WatchKit Extension
//
//  Created by ryo fuj on 1/31/22.
//

import SwiftUI

struct GoLight: View {
    
    public var colorPicked:Color
    
    var body: some View {
        ZStack{
            Image(systemName: "circle.fill")
                .foregroundColor(colorPicked)
            Text("💵")
                .font(.title2)
        }
    }
}

struct GoLight_Previews: PreviewProvider {
    static var previews: some View {
        GoLight(colorPicked: Color(red: 90/256, green: 227/256, blue: 15/256))
    }
}
