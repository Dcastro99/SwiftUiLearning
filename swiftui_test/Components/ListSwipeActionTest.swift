//
//  ListSwipeActionTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/22/24.
//

import SwiftUI

struct ListSwipeActionTest: View {
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    var body: some View {
        List{
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit.capitalized)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false){
                        Button("Save") {
                            save(fruit: fruit)
                        }
                        .tint(.green)
                        Button("Junk") {
                          
                        }
                        .tint(.black)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true){
                        Button("Add") {
                     
                        }
                        .tint(.blue)
                      
                    }
            }
//            .onDelete(perform: delete)
        }
    }
    
    
    func delete(indexSet: IndexSet){
        
    }
    func save(fruit: String){
        print("The fruit is \(fruit)")
    }
}

#Preview {
    ListSwipeActionTest()
}
