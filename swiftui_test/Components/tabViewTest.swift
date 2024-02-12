//
//  tabViewTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/12/24.
//

import SwiftUI

struct tabViewTest: View {
    @State var selectedTab: Int = 0
    var tColor = #colorLiteral(red: 0.9246651786, green: 0.8929483754, blue: 0.8376240318, alpha: 1)
 
    
    
    var body: some View {
        TabView(selection:$selectedTab){
        
            Group{
                HomeView(selectedTab: $selectedTab)
                    .tabItem { Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                Text("Browse Tab")
                    .tabItem { Image(systemName: "globe")
                        Text("Browse")
                    }
                    .tag(1)
                Text("Profile Tab")
                    .tabItem { Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(2)
            }
            .toolbarBackground(Color(tColor), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            
        }
        .accentColor(.orange)
    }
}

#Preview {
    tabViewTest()
}


