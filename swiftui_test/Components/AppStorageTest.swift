//
//  AppStorageTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/20/24.
//

import SwiftUI

struct AppStorageTest: View {
    
   
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20){
            Text(currentUserName ?? "no userName")
            
            Button("Save".uppercased()){
                let name = "Nick"
                currentUserName = name
           
            }
        }
      
    }
}

#Preview {
    AppStorageTest()
}
