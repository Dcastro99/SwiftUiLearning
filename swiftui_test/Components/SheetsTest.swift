//
//  SheetsTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/5/24.
//

import SwiftUI

struct SheetsTest: View {
    @State var showSheet: Bool = false
   
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .foregroundStyle(.black)
                    .font(.headline)
                    .padding()
                    .background(Color.gray.cornerRadius(8))
            })
//            .fullScreenCover(isPresented: $showSheet, content: {
//                SecondScreen()
//            })
            .sheet(isPresented: $showSheet, content: {
              SecondScreen()
            })
        }
    }
}

struct SecondScreen: View {
    @Environment(\.presentationMode) var presentationMode
    var bgColor = #colorLiteral(red: 0.9617154893, green: 0.970407197, blue: 0.9373187397, alpha: 1)
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color(bgColor)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.black)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(20)
                
            })
        }
    }
}

#Preview {
    SheetsTest()
}
