//
//  AnyLayoutTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/26/24.
//

import SwiftUI

struct AnyLayoutTest: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var body: some View {
        VStack(spacing: 12){
            Text("Horizontal: \(horizontalSizeClass.debugDescription)")
            Text("Vertical: \(verticalSizeClass.debugDescription)")
            
            let layout: AnyLayout = horizontalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
            
            layout{
                Text("Good")
                Text("Great")
                Text("Better")
            }
            
//            if horizontalSizeClass == .compact {
//                VStack{
//                    Text("Good")
//                    Text("Great")
//                    Text("Better")
//                }
//            } else{
//                HStack{
//                    Text("bad")
//                    Text("real bad")
//                    Text("Worse")
//                }
//            }
        }
    }
}

#Preview {
    AnyLayoutTest()
}
