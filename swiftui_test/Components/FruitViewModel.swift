//
//  FruitViewModel.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/19/24.
//

import Foundation

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 88)
        
        fruitArray.append(fruit1)
        fruitArray.append(fruit2)
        fruitArray.append(fruit3)
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
    
}
