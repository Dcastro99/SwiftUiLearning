//
//  backgroundTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 1/26/24.
//

//



import SwiftUI

struct backgroundTest: View {
    var color = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color(color))
            .bold()
        
        
            .frame(width: 100, height: 100, alignment: .center)
            .background(Circle().fill(Color.blue))
            .frame(width: 120, height: 120, alignment: .center)
            .background(
            Circle()
                .fill(Color.orange)
            )
            .frame(width: 140, height: 140, alignment: .center)
            .background(
            Circle()
                .fill(Color.black)
                .shadow( radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:5, y:10)
            )
            
    }
}

#Preview {
    backgroundTest()
}
