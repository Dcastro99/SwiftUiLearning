//
//  NavigationStackTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/22/24.
//

import SwiftUI

struct NavigationStackTest: View {
    var body: some View {
        ScrollView{
            VStack{
                ForEach(0..<10){ v in
                    NavigationLink(destination:{
                        MySecondScreen(value: v)
                    }) {
                        Text("click here")
                    }
                }
            }
        }
    }
}


struct MySecondScreen: View{
    let val: Int
    
    init(value:Int){
        self.val = value
        print("Init Screen: \(value)")
    }
    
    var body: some View{
        Text("Screen \(val)")
    }
}

#Preview {
    NavigationStackTest()
}
