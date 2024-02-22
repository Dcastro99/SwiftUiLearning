//
//  PickerTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/20/24.
//

import SwiftUI

struct PickerTest: View {
    var fruits = ["Banana","Apple", "Peach", "Watermelon", "Grapes" ]
    @State private var selectedFruit = 0
    
    var body: some View {
        Form {
//            // Variation 1
//            Picker(selection: $selectedFruit, label: Text("Select Favorite Fruit")) {
//                ForEach(0..<fruits.count, id: \.self) {
//                    Text(self.fruits[$0])
//                }
//            }
            // Variation 2
            Picker(selection: $selectedFruit) {
                ForEach(0..<fruits.count, id: \.self) {
                    Text(self.fruits[$0])
                }
            } label: {
                HStack {
                    Text("Favorite Fruit")
                    Divider()
                    Text(fruits[selectedFruit])
                }
            }
            
            // Variation 3
//            Menu {
//                ForEach(0..<fruits.count, id: \.self) {
//                    Text(self.fruits[$0])
//                }
//            } label: {
//                HStack {
//                    Text("Favorite Fruit")
//                    Divider()
//                    Text(fruits[selectedFruit])
//                }
//            }
            
        }
        .pickerStyle(.menu)
    }
}
#Preview {
    PickerTest()
}
