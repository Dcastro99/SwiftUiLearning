//
//  ifLetTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/13/24.
//

import SwiftUI

struct ifLetTest: View {
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    @State var userID: String? = nil
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Here we practice safe coding!")
                
                if let text = displayText{
                    Text(text)
                        .font(.title)
                    
                }
             
        
                if isLoading {
                    ProgressView()
                }
                Spacer()
            } //VStack
            .navigationTitle("SAFE CODING")
            .onAppear {
                loadData2()
            }
        } //NavigationView
        
    }
 
    func loadData(){
        if let currUserId = userID{
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                displayText = "OK...userID is: \(currUserId)"
                isLoading = false
            }
        }else {
            displayText = " No user found."
        }
    }
    
    func loadData2() {
        guard let currUserId = userID else {
            displayText = " No user found in LD2."
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            displayText = "OK LD2...userID is: \(currUserId)"
            isLoading = false
        }
        
    }
    
}

#Preview {
    ifLetTest()
}
