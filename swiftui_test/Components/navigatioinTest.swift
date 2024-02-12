//
//  navigatioinTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/5/24.
//

import SwiftUI

struct navigatioinTest: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                NavigationLink("My Other Screen",
                               destination: MyOtherScreen()
                )
                
                Text("Hello, World!")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("Hello, World!")
            }
            .navigationTitle("This is the Navigation Page")
//            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
            .navigationBarItems(
                leading: Image(systemName: "person.fill"),
                trailing: Image(systemName: "gear")
                )
        }
      
    }
}

struct MyOtherScreen: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                        .font(.title)
                        .padding(20)
                })
            }
        }
    }
}

#Preview {
    navigatioinTest()
}
