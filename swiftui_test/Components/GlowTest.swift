//
//  GlowTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/22/24.
//

import SwiftUI

struct GlowTest: View {
    @State private var isPulsating = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .scaleEffect(isPulsating ? 1.2 : 1.0)
                .animation(Animation.easeIn(duration: 1).repeatForever())
                .onAppear() {
                    self.isPulsating = true
                }
                .overlay(Text("Hi"))
            
            Circle()
                .stroke(Color.blue, lineWidth: 10)
                .blur(radius: 10)
                .frame(width:60, height: 60)
                .opacity(0.7)
                .offset(x: -5, y: -5)
            
            Circle()
                .stroke(Color.blue, lineWidth: 10)
                .blur(radius: 10)
                .frame(width: 70, height: 70)
                .opacity(0.5)
                .offset(x: -10, y: -10)
            
            Circle()
                .stroke(Color.blue, lineWidth: 10)
                .blur(radius: 10)
                .frame(width: 80, height: 80)
                .opacity(0.3)
                .offset(x: -15, y: -15)
        }
    }
}

#Preview {
    GlowTest()
}
