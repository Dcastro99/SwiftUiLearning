//
//  AsyncImageTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/21/24.
//

import SwiftUI

struct AsyncImageTest: View {
    /*
     remove "G" from PNG to test case.failure
     */
    let url = URL(string:"https://mario.nintendo.com/static/d783068682f98d6cfec666c747a27793/d6e64/mario.png")
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case.empty:
                ProgressView()
            case.success(let returnImage):
                returnImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
//                    .background(Color.gray)
                    .cornerRadius(20)
            case.failure:
                VStack(spacing:20){
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 100))
                    
                    Text("No image found!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                    
            default:
                Image(systemName: "questionmark")
                    .font(.title)
            }
        }
//        AsyncImage(url: url) { returnImage in
//            returnImage
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .background(Color.gray)
//                .cornerRadius(20)
//        } placeholder: {
//          ProgressView()
//        }

    }
}

#Preview {
    AsyncImageTest()
}
