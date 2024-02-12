//
//  testView.swift
//  swiftui_test
//
//  Created by Danny Castro on 1/25/24.
//

import SwiftUI

struct testView: View {
    var body: some View {
       
        VStack{
            RoundedRectangle(cornerRadius: 20)
//                .stroke(.black,lineWidth: 5)
//                    .background(.red)
                .fill(Color("CustomColor"))
                .frame(width: 300, height: 200, alignment: .leading)
                .overlay(
                    Text("I believe Rusty is the stinky one, not Mr. Beans. I hope to one day reveal this atrocious secret to the world!")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .kerning(2)
                        
                       
                        .padding(10.0)
                        .baselineOffset(10)
                    )
              
            Image(systemName: "person.crop.circle.fill.badge.plus")
                
                .foregroundColor(.red)
                .font(.system(size: 50))
                .padding()
            
        }
       
       
            

        
        
    }
    
}

#Preview {
    testView()
}
