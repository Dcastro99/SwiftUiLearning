//
//  NavigationToolBarTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/22/24.
//

import SwiftUI

struct NavigationToolBarTest: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color.green.ignoresSafeArea()
                Text("Hey Guys!")
                    .foregroundStyle(Color.white)
                
            }
            .navigationTitle("ToolBar")
//            .navigationBarItems(leading: Image(systemName: "heart.fill"), trailing: Image(systemName: "gear"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "heart.fill")
                }
                ToolbarItem(placement: .principal) {
                    Text("Hey")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

#Preview {
    NavigationToolBarTest()
}
