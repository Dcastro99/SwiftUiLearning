//
//  isLoadingTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/2/24.
//

import SwiftUI

struct LoadingProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            Text("Loading...")
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(8.0)
            
            ProgressView(configuration)
                .frame(height: 10)
                .progressViewStyle(DarkBlueProgressViewStyle())
        }
    }
}

struct DarkBlueProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8.0)
                    .frame(width: geometry.size.width, height: 50)
                    .foregroundColor(Color.gray)
                
                RoundedRectangle(cornerRadius: 8.0)
                    .frame(width: geometry.size.width * CGFloat(configuration.fractionCompleted ?? 0), height: 50)
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct contentView: View {
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(LoadingProgressViewStyle())
                    .onAppear {
                        // Simulate loading delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                        }
                    }
            } else {
                Text("Content Loaded!")
                    .padding()
                Button("Load Content") {
                    isLoading = true
                }
                .padding()
            }
        }
    }
}

#Preview{
    contentView()
}

