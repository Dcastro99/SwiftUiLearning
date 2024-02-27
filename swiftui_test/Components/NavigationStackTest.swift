//
//  NavigationStackTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/22/24.
//

import SwiftUI

struct NavigationStackTest: View {
    let fruits: [String] = ["apple", "orange", "banana"]
    
    /*
     NavigationStak(path:   ) pushes multiple screens at once. when you click back on the screen it moves backwards in the array untill completed and then finally back to the main screen.
     */
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (spacing:20){
                    
                    ForEach(fruits, id: \.self){ fruit in
                        NavigationLink(value: fruit) {
                       Text(fruit)
                        }
                    }
                    
                    
                    
                    ForEach(0..<10){ v in
                        NavigationLink(value: v) {
                            Text("click here \(v)")
                        }
                 
                    }
                   
                }
                .navigationTitle("Nav Test")
                .navigationDestination(for: Int.self) { val in
                    MySecondScreen(value: val)
                }
                .navigationDestination(for: String.self) { val in
                    Text("\(val) Screen")
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
