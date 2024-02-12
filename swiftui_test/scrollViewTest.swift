//
//  scrollViewTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 1/31/24.
//

import SwiftUI

struct scrollViewTest: View {
    var body: some View {
        VStack {
           
            ScrollView {
//                Text("Hello, World!")
//                    .font(.largeTitle)
//                    .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach(0..<1) { n in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(20)
                      
                }
            }
            
            
        }
        .background(Color.red)
    }
}


#Preview {
    scrollViewTest()
}
