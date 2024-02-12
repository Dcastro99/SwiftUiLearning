//
//  ErrorAlert.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/6/24.
//

import SwiftUI

struct ErrorAlert: View {
    @State private var showAlert: Bool = false
    @State var backgroundColor = Color.orange
    @State var alertType: MyAlerts? = nil
//    @State var alertTitle: String = ""
//    @State var alertMessage: String = ""
    
    enum MyAlerts {
        case passwordError
        case emailError
        case success
        
    }
    
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack{
                Button("Click") {
                    alertType = .passwordError
              
//                    alertTitle = "Password Error"
//                    alertMessage = "Password must be atleast 6 characters."
                    showAlert.toggle()
                }
                Button("Click 2") {
                    alertType = .emailError
//                    alertTitle = "Email Error"
//                    alertMessage = "Email already exists."
                    showAlert.toggle()
                }
                Button("Click 3") {
                    alertType = .success
                    //                    alertTitle = "Email Error"
                    //                    alertMessage = "Email already exists."
                    showAlert.toggle()
                }
            }
        }
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    

    func getAlert() -> Alert{
        switch alertType {
        case .emailError:
            return Alert(title: Text("Email is incorrect"))
            case .passwordError:
            return Alert(title: Text("Password is incorrect"))
            case .success:
            return Alert(title: Text("Success"),
                         dismissButton: .default(Text("SUCCESS"), action: {
                backgroundColor = Color.green
            }))
            
        default:
           return Alert(title: Text("Error"))
        }
//        return Alert(
//            title: Text(alertTitle),
//            message: Text(alertMessage),
//            dismissButton: .default(Text("OK"))
//        )
    }
    
}

#Preview {
    ErrorAlert()
}
