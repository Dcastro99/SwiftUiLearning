//
//  ButtonStyleTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/22/24.
//

import SwiftUI

struct ButtonStyleTest: View {
    var body: some View {
        VStack{
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("I Am A Button")
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            })
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            
            
            
            Button("I Am A Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Button("I Am A Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            
            Button("I Am A Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .buttonStyle(.borderedProminent)
            
            Button("I Am A Button") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .buttonStyle(.borderless
            )
        }
        .padding()
    }
}

#Preview {
    ButtonStyleTest()
}
