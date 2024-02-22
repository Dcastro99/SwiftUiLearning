//
//  FocusedStateTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/22/24.
//

import SwiftUI

struct FocusedStateTest: View {
    enum OnboardingField: Hashable {
        case username
        case password
    }
    
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState private var feildsInFocus: OnboardingField?
//    @FocusState private var userNameFocus: Bool
//    @FocusState private var passwordFocus: Bool
    var body: some View {
        VStack(spacing: 40){
            TextField("Add name here", text: $username)
                .focused($feildsInFocus, equals: .username)
//                .focused($userNameFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
                .onSubmit {
                    let usernameIsValid = !username.isEmpty
                    let passwordIsValid = !password.isEmpty
                    
                    if usernameIsValid && passwordIsValid {
                        print("You did it!")
                        clearTextField()
                        
                    } else if usernameIsValid {
                        feildsInFocus = .password
                        //                    userNameFocus = false
                        //                    passwordFocus = true
                    } else {
                        feildsInFocus = .username
                        //                    userNameFocus = true
                        //                    passwordFocus = false
                    }
                }
            
            SecureField("Add password", text: $password)
                .focused($feildsInFocus, equals: .password)
//                .focused($passwordFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
//            Button("Add Focus State") {
//                userNameFocus.toggle()
//            }
            
//            Button("Sign Up") {
//                let usernameIsValid = !username.isEmpty
//                let passwordIsValid = !password.isEmpty
//                
//                if usernameIsValid && passwordIsValid {
//                    print("Success!")
//                   clearTextField()
//
//                } else if usernameIsValid {
//                    feildsInFocus = .password
////                    userNameFocus = false
////                    passwordFocus = true
//                } else {
//                    feildsInFocus = .username
////                    userNameFocus = true
////                    passwordFocus = false
//                }
//               
//            }
//            
        }
        .padding(40)
    }
    func clearTextField() {
        $username.wrappedValue = ""
        $password.wrappedValue = ""
    }
}

#Preview {
    FocusedStateTest()
}
