//
//  FruitModel.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/19/24.
//

import Foundation

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}
