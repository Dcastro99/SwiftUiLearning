//
//  formTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 1/30/24.
//

import SwiftUI


struct formTest: View {
    
    // MARK: PROPERTIES
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    
    let photoURL = URL(string: "https://i.imgur.com/t8VrqzM.png")
    var body: some View {
        GeometryReader { geometry in
            bodyContent(geometry: geometry)
        }
    }
    
    // MARK: BODY CPONTENT
    
    func bodyContent(geometry: GeometryProxy) -> some View {
        let bgColor = #colorLiteral(red: 0.9246651786, green: 0.8929483754, blue: 0.8376240318, alpha: 1)
        let mainBG = #colorLiteral(red: 0.9914150834, green: 0.9771276116, blue: 0.9294666648, alpha: 1)
        let hintColor = #colorLiteral(red: 0.3487807765, green: 0.3487807765, blue: 0.3487807765, alpha: 0.4565914735)
       return ZStack(alignment: .center) {
            Color(mainBG)
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(bgColor))
                    .frame(width: min(geometry.size.width - 40, 390), height: min(geometry.size.height - 40, 700))
                    .overlay(
                        VStack(alignment: .center) {
                            Spacer().frame(height: 25)
                            
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: 180, height: 180)
                                .overlay(
                                    AsyncImage(url: photoURL) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                                    } placeholder: {
                                        ProgressView()
                                    }
                                )
                                .shadow(color: .gray, radius: 10, x: 0, y: 10)
                                .padding()
                            
                            Spacer().frame(height: 80)
                            
                            TextField("",
                                      text: $emailText,
                                      prompt: Text("Email")
                                .foregroundColor(Color(hintColor))
                                      
                            )
                            .autocapitalization(.none)
                            .textFieldStyle(MyTextFieldStyle())
                            .padding(.horizontal, 15)
                            .foregroundColor(.black)
                            
                            
                            
                            Spacer().frame(height: 20)
                            
                            SecureField("", text: $passwordText,
                                        prompt: Text("Password")
                                .foregroundColor(Color(hintColor))
                            )
                            .textFieldStyle(MyTextFieldStyle())
                            .padding(.horizontal, 15)
                            .foregroundColor(.black)
                            
                            
                            Spacer().frame(maxHeight: 120)
                            
                            Button(action: {
                                submit()
                            }, label: {
                                Text("Sign in")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                    .frame(width: min(geometry.size.width - 80, 350), height: 70)
                                    .background(Color.black)
                                    .cornerRadius(10)
                            })
                            .disabled(!isValid())
                            Spacer()
                        }
                    )
            }
        }
    }
    // MARK: FUNCTIONS
    
    //------------------CLEAR TEXT FIELD FUNCTION----------------------//
    
    func clearTextField(email: Binding<String>, password: Binding<String>) {
        email.wrappedValue = ""
        password.wrappedValue = ""
    }
    
    //----------------------SUBMIT FUNCTION---------------------------//
    
    func submit(){
        print("Email: \(emailText)")
        print("Password: \(passwordText)")
        clearTextField(email: $emailText, password: $passwordText)
    }
    
    func isValid() -> Bool {
        if emailText == "" && passwordText == ""{
            return false
        }
        return true
    }
 
}



// MARK: PREVIEW
#Preview {
    formTest()
}
