//
//  pageTabViewTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/12/24.
//

import SwiftUI

struct pageTabViewTest: View {
    let icons: [String] = [
    "heart.fill", "globe", "house.fill", "person.fill"
    ]
    var body: some View {
        TabView {
            ForEach(icons, id: \.self){icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
            
        }
        .background(RadialGradient(gradient: Gradient(colors:[ Color.orange, Color.black]), center: .center, startRadius: 5, endRadius: 350))
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
   
        pageTabViewTest()
          
   
 
}
