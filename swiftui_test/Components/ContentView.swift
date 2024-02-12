//
//  ContentView.swift
//  swiftui_test
//
//  Created by Danny Castro on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let customColor = Color(
                       red: Double(200) / 255,
                       green: Double(116) / 255,
                       blue: Double(79) / 255,
                       opacity: Double(255) / 255
                   )
        Image("flutter")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 5)
            )
            .shadow(radius: 10)
            .padding()
        Text("I miss Fluter")
            .padding()
        
        
       Button(action: agree) {
           Text("Agree").padding()
               .fontWeight(.bold)
               .background(Color.gray)
               .foregroundColor(.white)
               .cornerRadius(20)
       }
       .shadow(radius: 10)
       .shadow(color:customColor, radius: 4, x: 0, y: 2)
        
    }
}

func agree() {
    print("Agreed")
}


#Preview {
    ContentView()
}
