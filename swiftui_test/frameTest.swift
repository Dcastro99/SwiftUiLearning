//
//  frameTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 1/26/24.
//

import SwiftUI

struct frameTest: View {
    var body: some View {
        
        
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
    }
    
    
    
}

#Preview {
    frameTest()
}

