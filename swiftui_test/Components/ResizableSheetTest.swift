//
//  ResizableSheetTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/22/24.
//

import SwiftUI

struct ResizableSheetTest: View {
    @State private var showSheet: Bool = false
    var body: some View {
        Button("Click me") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet, content: {
            MyNextView()
                .presentationDetents([.medium, .large])
//                .interactiveDismissDisabled()
        })
    }
}

struct MyNextView: View {
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            Text("new screen!")
        }
    }
}

#Preview {
    ResizableSheetTest()
}
