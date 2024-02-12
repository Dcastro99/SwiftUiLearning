//
//  buttonTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/1/24.
//

import SwiftUI

struct buttonTest: View {
    @State var title: String = "This is the title"
    @State private var isAnimating = false
    @State private var isPressed = false
    @State private var counter = 0
    var body: some View {
        
        VStack(spacing: 20)
        {
            Text("\(counter)")
                .font(.system(size: 60))
                .foregroundColor(.red)
                .opacity(isPressed ? 0.5 : 1)
                .scaleEffect(isPressed ? 2 : 1)
            Text(title)
            Button(action: {
                self.title = "Button #2 was pressed"
            }, label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 60)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 10, x: 0, y: 10)
            })
            Button("Press me"){
                self.title = "Button pressed"
            }
            Button(action: {
                // Your button action logic goes here
            }) {
                Text("Click me".uppercased())
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.green]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(10)
            }
            .scaleEffect(isAnimating ? 0.95 : 1.2)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 4)) {
                    isAnimating.toggle()
                }
                
                
            }
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 200, height: 60)
                    .shadow(radius: 10, x: 5, y: 10)
                Text("Press me")
                    .foregroundColor(.white)
                    .font(.title)
            }
            .opacity(isPressed ? 0.2 : 1)
            .scaleEffect(isPressed ? 0.8 : 1)
            . onTapGesture  {
                counter += 1
            }
          
            .pressEvents {
                withAnimation(.easeIn(duration: 0.1)) {
                    isPressed = true
                }
            } onRelease: {
                withAnimation{
                    isPressed = false
                }
                
            }
        }
    }
    
}

#Preview {
    buttonTest()
}

