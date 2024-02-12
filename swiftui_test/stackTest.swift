//
//  stackTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 1/29/24.
//

import SwiftUI

struct stackTest: View {
    let nameList = ["Danny", "Bob", "Marry", "Jenny"]

    var body: some View {
       
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(nameList, id: \.self) { name in
                        Button(action: {
                            // Handle button press
                            print("Button pressed for \(name)")
                        }) {
                            Text(name)
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
        
                .frame(width:500, height: 600)
            .padding(8.0) // Add padding around ScrollView
            .border(Color.black, width: 5)
            
        }
    
    }
}

#Preview {
    stackTest()
}
