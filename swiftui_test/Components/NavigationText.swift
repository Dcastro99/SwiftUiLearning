//
//  NavigationText.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/5/24.
//

import SwiftUI

struct NavigationTest: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Go to Second Page", destination: SecondPage())
            }
            .navigationTitle("First Page")
        }
    }
}

struct SecondPage: View {
    var body: some View {
        VStack {
            Text("Second Page Content")
        }
        .navigationTitle("Second Page")
    }
}
#Preview {
    NavigationTest()
}
