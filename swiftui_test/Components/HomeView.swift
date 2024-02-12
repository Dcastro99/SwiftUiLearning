//
//  HomeView.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/12/24.
//

import SwiftUI



struct HomeView: View {
    // MARK: PROPERTIES
    @Binding var selectedTab: Int
    var body: some View {
        ZStack{
            Color.red
            VStack{
                Text("Home View")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Button(action: {
                    selectedTab = 2
                }
                       , label: {
                    Text("Profile")
                        .font(.headline)
                        .foregroundColor(.white)
                })
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    HomeView(selectedTab: .constant(2) )
}
