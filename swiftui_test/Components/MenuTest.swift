//
//  MenuTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/23/24.
//

import SwiftUI

struct MenuTest: View {
    @State private var bgColor = Color.blue
    
    var body: some View {
        ZStack{
            bgColor.ignoresSafeArea()
            Menu("Pick Me") {
               
                Button("One") {
                    bgColor = Color.red
                }
                Button("Two") {
                    bgColor = Color.green
                }
                Button("Three") {
                    bgColor = Color.purple
                }
                Button("Four") {
                    bgColor = Color.black
                }
                
            }
            
            .foregroundColor(.white)
            .font(.title)
          
        }
    
        
    }
}

#Preview {
    MenuTest()
}
