//
//  OnboardingView.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/20/24.
//

import SwiftUI

struct OnboardingView: View {
    
    //onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    // for alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
   
    // Onboarding states:
    /*
     0 - Welcome Screen
     1 Add name
     2 Add age
     4 - Add gender
     */
    @State var onbiardingState: Int = 0
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    //app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("Signed_in") var currentUserSignedIn: Bool = false
    
    // MARK: BODY
    var body: some View {
        ZStack {
            //Content
            ZStack{
                switch onbiardingState {
                case 0 :
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    genderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.green)
                
                }
            }
            
            //Button
            VStack{
                Spacer()
             bottomButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title:Text(alertTitle))
        })
    }
}

#Preview {
    OnboardingView()
       
}





//MARK: COMPONENTS

extension OnboardingView{
    
    //------------SIGN-IN BUTTON------------------//
    private var bottomButton: some View{
        Text(onbiardingState == 0 ? "Sign up":
                onbiardingState == 3 ? "Finished" :
                "Next"
        )
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
               
                    handleButtonPressed()
              
            }
    }
    
    //--------------WELCOME SECTION-----------------//
    private var welcomeSection: some View{
        VStack(spacing:40){
            Spacer()
            Image(systemName: "dog.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find your pet!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .overlay(
                Capsule(style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .frame(height: 3)
                    .offset(y:5)
                    .foregroundColor(.white)
                , alignment: .bottom
                )
            Text("This is the best source in finding your next pet! In this tutorial we are  using AppStorage to save your information")
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    //--------------ADD NAME SECTION----------------//
    private var addNameSection: some View{
        VStack(spacing:40){
            Spacer()
          
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
            TextField("Your name here...", text:$name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
       
        .padding(30)
    }
    
    
    //------------ADD AGE SECTION---------//
    private var addAgeSection: some View{
        VStack(spacing:40){
            Spacer()
            
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
            
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
            Slider(value: $age, in: 18...100, step: 1)
                .accentColor(.white)
            Spacer()
            Spacer()
        }
        
        .padding(30)
    }
    
    
    //---------GENDER SECTION----------//
    private var genderSection: some View{
        
        
      
            
        VStack(spacing:40){
            
            Spacer()
            
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
            Text(gender.count > 1 ? gender : "")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.purple)
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 55)
//            frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(gender.count > 1 ? 10 : 0)
                .background(Color.white)
            
                .cornerRadius(20)
               
                    Picker( selection: $gender,
                            label: Text(gender.count > 1 ? gender : "Select a gender")) {
                        Group {
                            Text("Select a gender").tag("")
                                .fontWeight(.bold)
                            Text("male").tag("male")
                            Text("female").tag("female")
                            Text("other").tag("other")
                        }
                        .font(.title)
                        .foregroundColor(.white)
                            
                    }
                            .pickerStyle(.wheel)
             
          
            Spacer()
            Spacer()
        }
            
            .padding(30)
      
    }
    
    // MARK: FUNCTIONS
    
  
   
}

//MARK: FUNCTIONS
extension OnboardingView {

    func handleButtonPressed(){
        
        switch onbiardingState{
        case 1:
            guard name.count > 3 else {
                showAlert(title: "Your name must be at least 3 characters long! 🥲")
                return
            }
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender before moving forward! 🤓")
                return
            }
        default:
            break
        }
        if onbiardingState == 3{
            signIn()
        }else{
            withAnimation(.spring()){
                onbiardingState += 1
            }
        }
    }
    
    func signIn(){
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()){
            currentUserSignedIn = true
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}

