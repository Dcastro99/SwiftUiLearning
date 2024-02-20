//
//  ModelTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/13/24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}


struct ModelTest: View {
    
    @State var users: [UserModel] = [
        UserModel(displayName: "Danny", userName: "dcastro99", followerCount: 1, isVerified: false),
        UserModel(displayName: "Rusty", userName: "BadBoy", followerCount: 100000, isVerified: true),
        UserModel(displayName: "Beans", userName: "Beanard", followerCount: 5, isVerified: false),
        UserModel(displayName: "Jaxson", userName: "HiBeans!", followerCount: 500, isVerified: true)
    ]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(users){ user in
                    HStack (spacing: 15){
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        
                        if user.isVerified{
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                       
                        VStack{
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 10)
                             }
//                ForEach(users, id: \.self) { userName in
//                    HStack (spacing: 15){
//                        Circle()
//                            .frame(width: 35, height: 35)
//                        Text(userName)
//                    }
//                    .padding(.vertical, 10
//                    )
//                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ModelTest()
}
