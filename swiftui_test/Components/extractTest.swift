//
//  extractTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/2/24.
//

import SwiftUI

struct extractTest: View {
    var bgColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    var body: some View {
        ZStack{
         Color(bgColor)
            MyItem()
        }
    }
    
}

#Preview {
    extractTest()
}

//------This can be in a separate file

struct MyItem: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Hey Stupid")
        }
        .padding()
        .background(Color.red)
        .cornerRadius(10)
    }
}
