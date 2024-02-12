//
//  ListTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/5/24.
//

import SwiftUI

struct ListTest: View {
    @State var fruits: [Fruit] = [
        Fruit(name: "Apple", image: "appleImage", qty: 6),
        Fruit(name: "Orange", image: "orangeImage", qty: 4),
        Fruit(name: "Banana", image: "bananaImage", qty: 8),
    ]
    
    @State var veggies: [String] = [
        "carrot", "broccoli", "spinach", "kale"
    ]
    
    struct Fruit{
        var name: String
        var image: String
        var qty: Int
    }
    
    var body: some View {
        
        NavigationStack{
            GeometryReader{ g in
                HStack{
                    
                    List{
                        Section(header: Text("Fruits")
                            .foregroundStyle(Color.red)
                        ) {
                            ForEach(fruits, id: \.name) { fruit in
                                HStack{
                                    Text(fruit.name.capitalized)
                                    Spacer()
                                    Text("\(fruit.qty)")
                                }
                                .padding(8)
                            }
                            .onDelete(perform:delete)
                            .onMove(perform: move)
                        }
                        
                        Section {
                            ForEach(veggies, id: \.self) { veggie in
                                Text(veggie.capitalized)
                            }
                            .onDelete(perform:delete)
                            .onMove(perform: move)
                        } header: {
                            Text("Veggies")
                                .foregroundStyle(Color.red)
                        }
                        
                        
                    }
                    .frame(width: g.size.width * 0.3)
                    .listStyle(.sidebar)
                    .navigationTitle("Grocery List")
                    .navigationBarItems(
                        leading: EditButton(), trailing: addButton
                    )
                    
                    Divider()
                    
                    
                    
                    
                    VStack(alignment: .center){
                        
                        ScrollView{
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color.red)
                                .frame(height:g.size.height * 0.5)
                                .padding()
                            
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color.red)
                                .frame(height:g.size.height * 0.5)
                                .padding()
                        }
                        
                        
                    }
                    .padding()
                    
                }
                
                
            }
            .accentColor(.red)
        }
        
    }
    
    
    
    
    var addButton: some View {
        Button("Add", action: {
            add()
        })
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
        veggies.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newIndex: Int) {
        fruits.move(fromOffsets: indices, toOffset: newIndex)
        veggies.move(fromOffsets: indices, toOffset: newIndex)
    }
    
    func add() {
        fruits.append(Fruit(name: "New Fruit", image: "newFruitImage", qty: 1))
    }
}


#Preview {
    ListTest()
}
