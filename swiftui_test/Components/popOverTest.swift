//
//  popOverTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/5/24.
//

import SwiftUI

struct popOverTest: View {
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
               
                    Button("Button") {
                        withAnimation(.spring(duration: 0.5, bounce: 0.0))  {
                        showNewScreen.toggle()
                }
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                Spacer()
               
            }
            // METHOD 1 - SHEETS
            .sheet(isPresented: $showNewScreen, content: {
               newScreen()
            })
            
            //METHOD 2 -TRANSITIONS
//            ZStack{
//                if showNewScreen {
//                    newScreen(showNewScreen: $showNewScreen)
//                        .padding(.top, 80)
//                        .transition(.move(edge: .bottom))
//    //                    .animation(.spring())
//                }
//            }
//            .zIndex(2.0)
            // METHOD 3 - ANIMATION/OFFSET
            
//            newScreen(showNewScreen: $showNewScreen)
//                .padding(.top, 80)
//                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
//                .animation(.spring(duration: 0.5, bounce: 0.0), value: showNewScreen)
        }
    }
}

struct newScreen: View {
    @Environment(\.presentationMode) var presentationMode
//    @Binding var showNewScreen: Bool
    var body: some View {
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack{
                Button("Button") {
                    
                    presentationMode.wrappedValue.dismiss()
//                    withAnimation(.spring(duration: 0.5, bounce: 0.0))  {
//                        showNewScreen.toggle()
//                    }
                    
                }
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                Spacer()
            }
        }
    }
}

#Preview {
    popOverTest()
//    newScreen()
}
