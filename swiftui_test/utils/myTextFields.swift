//
//  myTextFields.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/1/24.
//
import SwiftUI




struct MyTextFieldStyle: TextFieldStyle {
    @FocusState private var isFocused: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.white)
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(isFocused ? Color.orange : Color.black, lineWidth: 0.5)
                    )
            )
            .focused($isFocused)
        
        
        
        
    }
}
