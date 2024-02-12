import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var emailError: String?
    @State private var passwordError: String?
    let photoURL = URL(string: "https://i.imgur.com/t8VrqzM.png")
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    
    struct ClearFieldsFunc {
        
        func clearTextField(email: Binding<String>, password: Binding<String>) {
            email.wrappedValue = ""
            password.wrappedValue = ""
        }
    }
    

    var body: some View {
      let photoURL = URL(string:"https://i.imgur.com/t8VrqzM.png" )
        NavigationStack {
            ZStack {
//                Color(hex: "#faf7f2").ignoresSafeArea()
                VStack {
                    Rectangle()
                        .fill(.clear)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.gray))
                        .frame(width:390, height: 700)
                        .overlay(
                            VStack(alignment: .center){
                                Spacer()
                                    .frame(height:25)
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: 150, height: 150)
                                
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
                                //                                    .padding(.top, 20.0)
                                    .shadow(color: .gray, radius: 20, x: 0, y: 20)
                                    .padding()
                                Spacer()
                                    .frame(height:50)
                                TextField("Email", text: $emailText)
                                
                                    .textFieldStyle(MyTextFieldStyle())
                                
                                    .padding()
                                Spacer()
                                    .frame(height: 0)
                                SecureField("Password", text: $passwordText)
                                    .textFieldStyle(MyTextFieldStyle())
                                    .padding()
                                Spacer()
                                    .frame(height:80)
                                Button(action: {
                                    print("Email: \(emailText)")
                                    print("Password: \(passwordText)")
                                    ClearFieldsFunc().clearTextField(email: $emailText, password: $passwordText)
                                }, label: {
                                    Text("Sign in")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                        .frame(width: 350, height: 60)
                                        .background(Color.black)
                                        .cornerRadius(10)
                                })
                                Spacer()
                            }
                        )
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.clear)
                }
                
                //  VStack(alignment: .leading) {
//                Rectangle()
//                    .fill(Color.clear)
//                    .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.5)
//                    .overlay(
//                        AsyncImage(url: photoURL) { image in
//                            image
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
//                        } placeholder: {
//                            ProgressView()
//                        }
//                    )
//                    .padding(.top, 20.0)
//                
//                Spacer()
//            }
                
                
                
                
                
                

//                VStack {
//                    Form {
//
//                            AsyncImage(url: photoURL) { image in
//                                        image
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
//                            } placeholder: {
//                                ProgressView()
//                            }
//                                
//                            
//                      
//
//                        Section {
//                            TextField("Email", text: $email)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .onChange(of: email, perform: { newEmail in
//                                    emailError = validateField(newEmail, "email")
//                                })
//
//                            
//                            TextField("Password", text: $password)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .onChange(of: password, perform: { newPassword in
//                                    passwordError = validateField(newPassword, "password")
//                                })
//                            HStack {
//                                Spacer()
//                                NavigationLink(destination: ForgotPasswordView()) {
//                                    Text("Forgot Password?")
//                                        .foregroundColor(Color(hex: "#2d56f7"))
//                                }
//                            }
//                        }
//
////                        Section {
//                            Button(action: signUserIn) {
//                                Text("Sign In")
//                                    .padding()
//                                    .foregroundColor(.white)
//                                    .background(Color.black)
//                                    .cornerRadius(10)
//                            }
////                        }
//                    }
//                    .padding()
//
////                    Spacer()
////
////                    HStack {
////                        Spacer()
////                        NavigationLink(destination: LiveView()) {
////                            Text("LIVE")
////                                .fontWeight(.bold)
////                                .foregroundColor(.black)
////                                .padding()
////                                .background(Color(.init(white: 0.27, alpha: 0.7)))
////                                .clipShape(Circle())
////                        }
////                        .padding(.trailing, 16)
////                    }
//                }

                if let errorMessage = emailError ?? passwordError {
                    ErrorDialog(message: errorMessage)
                }
            }
        }
    }

    private func validateField(_ value: String, _ fieldName: String) -> String? {
        if value.isEmpty {
            return "Please enter \(fieldName)"
        }
        return nil
    }

    private func signUserIn() {
        emailError = validateField(email, "email")
        passwordError = validateField(password, "password")

        if emailError == nil, passwordError == nil {
            // Perform sign-in logic here
        }
    }
}

#Preview{
    LoginView()
}



struct ErrorDialog: View {
    let message: String

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(message)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding()
            }
        }
    }
}

struct ForgotPasswordView: View {
    var body: some View {
        Text("Forgot Password Screen")
    }
}

struct LiveView: View {
    var body: some View {
        Text("Live Screen")
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0
        )
    }
}
