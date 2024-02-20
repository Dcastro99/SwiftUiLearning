//
//  ViewModelTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/13/24.
//

import SwiftUI





struct ViewModelTest: View {
    
    //@StateObject -> USE THIS ON CREATION / INIT
    //@ObservedObject -> USE THIS FOR SUBVIEWS
    
   @StateObject var fruitViewModel : FruitViewModel = FruitViewModel()
    
    var body: some View {
        
        
        NavigationStack{
            List{
           
                if fruitViewModel.fruitArray.count > 0 {
                    ForEach(fruitViewModel.fruitArray) {fruit in
                        HStack{
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                    
                    
                }
                else{
                    Text("No Fruits Found")
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Fruit List")
            .toolbar{
                ToolbarItem{
                    NavigationLink(destination: RandomScreen(fruitViewModel: FruitViewModel())) {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                    }
                 
                }
            }
//            .onAppear {
//                fruitViewModel.getFruits()
//            }
        }
    }
   
}

struct RandomScreen: View {
    @ObservedObject var fruitViewModel: FruitViewModel
   
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            VStack{
                ForEach(fruitViewModel.fruitArray){ fruit in
                    Text("\(fruit.name)")
                }
            }
        }
    }
}

#Preview {
    ViewModelTest()
//    RandomScreen()
}
