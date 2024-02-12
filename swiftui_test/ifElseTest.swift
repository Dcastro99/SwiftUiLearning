//
//  ifElseTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/2/24.
//

import SwiftUI

struct ifElseTest: View {
    @State var showCircle: Bool = false
    @State var showSquare: Bool = false
    @State private var progress: Double = 0.5
    var body: some View {
        VStack(spacing: 10)  {
            Spacer()
            Button("Circle Button: \(showCircle.description)"){
                showCircle.toggle()
            }
            .padding()
            Button("Square Button: \(showSquare.description)"){
                showSquare.toggle()
            }
            .padding()
            
            if showCircle && showSquare {
                HStack{
                    Circle()
                        .frame(width:100, height:100)
                    Rectangle()
                        .frame(width:100, height: 100)
                }
            }
            else if showSquare {
                Rectangle()
                    .frame(width:100, height: 100)
            } else if showCircle{
                Circle()
                    .frame(width:100, height:100)
            } else {
                Image(systemName: "hand.thumbsdown.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            ProgressView(value: progress)
                .progressViewStyle(CustomProgressViewStyle())
                .padding()
            Button("Increment Progress") {
                progress += 0.1
            }
            .padding()
            Spacer()
            
        }
    }
}
struct CustomProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            Text("Custom Progress:")
            ProgressView(configuration)
                .frame(height: 20)
                .background(Color.clear)
                .cornerRadius(8.0)
        }
    }
}

#Preview {
    ifElseTest()
}
