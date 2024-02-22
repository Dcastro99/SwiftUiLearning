//
//  IntroView.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/20/24.
//

import SwiftUI

struct IntroView: View {
    var firstColor = #colorLiteral(red: 0.2605186105, green: 0.2605186105, blue: 0.2605186105, alpha: 1)
    var secondColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
 
    @AppStorage("Signed_in") var currentUserSignedIn: Bool = false
    
    
    var body: some View {
        
        ZStack{
            RadialGradient(
                gradient: Gradient(colors: [Color(firstColor), Color(secondColor)]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            if currentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }else{
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
        }
        .animation(Animation.spring, value: currentUserSignedIn)
        
    }
}

#Preview {
    IntroView()
}
