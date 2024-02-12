//
//  ActionSheetTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/7/24.
//

import SwiftUI

struct ActionSheetTest: View {
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    var photoURL = URL(string:"https://i.imgur.com/Khvk5Fj.jpeg")
    
    enum ActionSheetOptions{
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .frame(width: 40, height: 40)
                    .overlay {
                        AsyncImage(url: photoURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        }
                    placeholder: {
                        ProgressView()
                    }
                    }
                Text("@WinnieLife")
                Spacer()
                Button(action: {
                    actionSheetOption = .isMyPost
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                })
                .accentColor(.primary)
            }
            .padding(.horizontal)
            
            Rectangle()
            .aspectRatio(1.0, contentMode: .fit) 
            .overlay {
                AsyncImage(url: photoURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                } 
            placeholder: {
                    ProgressView()
                }
            }
            
        }
        .confirmationDialog("What would you like to do?", isPresented: $showActionSheet, titleVisibility: .visible) {
            Button("Delete", role: .destructive, action: {
                
            }
            )
         
        }
//
//        .actionSheet(isPresented: $showActionSheet, content: {
//            getActionSheet()
//        })
        
       
            
            HStack{
                
                        HStack{
                            Image(systemName:"heart")
                    Image(systemName:"message")
                    Image(systemName:"paperplane")
                        }
                Spacer()
                Image(systemName:"bookmark")
            }
            .padding(8)
                
        
        
    }
                            

    
//    func getActionSheet() -> ActionSheet{
////        return ActionSheet(title:Text("This is the title"))
//        
//        let reportButton: ActionSheet.Button = .destructive(Text("Report"))
//        let deleteButton: ActionSheet.Button = .destructive(Text("Delete"))
//        let cancelBtn: ActionSheet.Button = .cancel(Text("Cancel"))
//        let shareButton: ActionSheet.Button = .default(
//           Text("Share")
//        )
//        let title = Text("What would you like to do?")
//        
//        switch actionSheetOption {
//        case .isMyPost:
//            return ActionSheet(title: title,
//            message: nil,
//                               buttons: [shareButton, reportButton ,deleteButton, cancelBtn]
//            )
//        case .isOtherPost:
//            return ActionSheet(title: title,
//            message: nil,
//                               buttons: [shareButton, reportButton , cancelBtn]
//            )
//        }
//    }
    
}

#Preview {
    ActionSheetTest()
}
