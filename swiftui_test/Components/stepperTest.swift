//
//  stepperTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/12/24.
//

import SwiftUI

struct stepperTest: View {
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack{
            Stepper("Stepper: \(stepperValue) ", value: $stepperValue)
            RoundedRectangle(cornerRadius:  25.0)
                .frame(width:  100 + widthIncrement, height: 100)
            Stepper("Stepper 2") {
//                widthIncrement += 10
                incrementWidth(x: 20)
            } onDecrement: {
//                widthIncrement -= 10
                incrementWidth(x: -20)
            }

        }
        .padding(50)
    }
    
    func incrementWidth(x:CGFloat){
        withAnimation{
            widthIncrement += x
        }
    }
    
}

#Preview {
    stepperTest()
}
