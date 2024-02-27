//
//  PopOverNEWTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/23/24.
//

import SwiftUI

struct PopOverNEWTest: View {
    let url = URL(string:"https://mario.nintendo.com/static/d783068682f98d6cfec666c747a27793/d6e64/mario.png")
    
    @State private var popOver: Bool = false
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            Button(action: {
                popOver.toggle()
                
            }, label: {
                Text("Click me now")
                    .foregroundStyle(Color.white)
                    .font(.title)
            })
            .popover(isPresented:$popOver, attachmentAnchor: .point(.top) ) {
//               Text("hey stupid")
                AsyncImage(url: url) { phase in
                    switch phase {
                    case.empty:
                        ProgressView()
                    case.success(let returnImage):
                        returnImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .onTapGesture {
                                print("Photo tapped")
                            }
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
                    
                    .presentationCompactAdaptation(.popover)
                    .padding()
            }
        }
    }
}

#Preview {
    PopOverNEWTest()
}
