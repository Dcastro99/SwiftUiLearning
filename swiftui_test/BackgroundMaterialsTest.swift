//
//  BackgroundMaterialsTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/21/24.
//

import SwiftUI

struct BackgroundMaterialsTest: View {
    var body: some View {
        VStack{
         
            Spacer()
            VStack{
                Text("HI")
            }
            .frame(height: 350)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        
        .background(
        Image("profilepic99")
            .resizable()
            .scaledToFill()
        )
        .background(Color.black)
    }
        
}

#Preview {
    BackgroundMaterialsTest()
}
