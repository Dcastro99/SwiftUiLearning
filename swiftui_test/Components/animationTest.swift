//
//  animationTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/2/24.
//

import SwiftUI

struct animationTest: View {
    @State var isAnimated: Bool = false
   
    var body: some View {
        VStack {
            Button(action: {
//                withAnimation(
//                                        Animation
//                                            .default
//                                            .repeatCount(1, autoreverses: false).speed(0.4)
//                                    ){
                    isAnimated.toggle()
//                                    }
            }, 
                    label: {
                Text("ANIMATE!".uppercased())
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width:isAnimated ? 00 : 200, height: 60)
                  
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 10, x: 0, y: 10)
                    .animation(Animation.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 1.0), value: isAnimated)
            })
            
          
            
        }
        Spacer()
            .frame(height:80)
        
        
        RoundedRectangle(cornerRadius: 20)
            .frame(width: isAnimated ? 350 : 00, height: 100)
            .animation(
                 Animation.spring(response:   0.5 , dampingFraction: 0.7, blendDuration: 1.0), value: isAnimated)
                
            .overlay(
                Text("Hello world!")
                    .foregroundColor(.white)
                    .font(.title)
            )
     
        
        Button(action: {
            
            isAnimated.toggle()
            
        }
           
               ,
               label: {
            Text("Close")
                .font(.title)
                .foregroundColor(.white)
                
                .frame(width:isAnimated ? 100 : 0, height: 100)
            
                .background(Color.red)
                .cornerRadius(100)
                .shadow(radius: 10, x: 0, y: 10)
                .animation(Animation.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 1.0), value: isAnimated)
        })
       
            
//
//

//        RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
//            .fill(isAnimated ? Color.red : Color.black)
//            .frame(width: isAnimated ? 50 : 10, height: isAnimated ? 50 : 10)
//            .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
//            .offset(y: isAnimated ? 650 : 0)
//           Spacer()
    }
}

#Preview {
    animationTest()
}
