//
//  BadgesTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/22/24.
//

import SwiftUI

struct BadgesTest: View {
    
    @State var nums: [String] = ["hi", "hello", "goodbye"]
    var body: some View {
        TabView {
            Color.purple
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge(nums.count)
            Color.blue
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
            Color.green
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
        }
    }
}

#Preview {
    BadgesTest()
}
