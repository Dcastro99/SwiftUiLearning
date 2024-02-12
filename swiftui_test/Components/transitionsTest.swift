//
//  transitionsTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/5/24.
//

import SwiftUI

struct transitionsTest: View {
    
    @State var showView: Bool = false
 
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            VStack {
                Button("Button") {
                    withAnimation {
                        showView.toggle()
                    }
                }
                Spacer()
            }
            
            if showView{
                
                RoundedRectangle(cornerRadius:  8)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .overlay(
                        Text("Hello")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    )
//                    .transition(.move(edge: .bottom))
//                                                    .transition(.slide)
//                                                .transition(.scale)
//                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .bottom)))
//                                                    .transition(.opacity)
                
                
                //
            }
            
        }
      
        .edgesIgnoringSafeArea(.bottom)
    }
    
}

#Preview {
    transitionsTest()
}
