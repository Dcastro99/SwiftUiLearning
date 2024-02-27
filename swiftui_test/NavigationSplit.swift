//
//  NavigationSplit.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/26/24.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct NavigationSplit: View {
    @State private var viz: NavigationSplitViewVisibility = .detailOnly
    @State private var selectedAsset: AssetCategory? = nil
//    @State private var selectedPicker: PickerList? = nil
    
    var body: some View {
        NavigationSplitView(columnVisibility: $viz) {
            VStack{
                List(AssetCategory.allCases, id: \.rawValue,  selection: $selectedAsset) { category in
                    NavigationLink(category.rawValue.capitalized, value: category)
                }
                .navigationTitle("Asset Type")
            }
        }
    detail: {
        VStack{
            
            if selectedAsset == nil {

                let landingIMG = URL(string: "https://i.imgur.com/uNkUBpQ.jpg")
                AsyncImage(url: landingIMG) { phase in
                    switch phase {
                    case.empty:
                        ProgressView()
                    case.success(let returnImage):
                        returnImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 800, height: 1200)
                            .cornerRadius(20)
                        
                        
                    case.failure:
                        VStack(spacing:20){
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.system(size: 100))
                            
                            Text("No image found!")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                        
                    default:
                        Image(systemName: "questionmark")
                            .font(.title)
                    }
                }
                  
               
            } else{
                
                    switch selectedAsset {
                    case .Picker:
                        Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                            ForEach(pickerList.chunked(into: 4), id: \.self) { row in
                                GridRow {
                                    ForEach(row, id: \.self.id) { pickerItem in
                                        cell(pickerItem: pickerItem)
                                    }
                                }
                            }
                        }
                        .padding()
                    case .SitDown:
                        EmptyView()
                    case .Forklift:
                        EmptyView()
                        
                    case .none:
                        EmptyView()
                    }
                    
               
            }
            Spacer()
        }
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("Branch Assest")
                    .font(.title)
            }
            
        }
    }
    .navigationSplitViewStyle(.prominentDetail)
    }
    
    private func cell(pickerItem: PickerItem) -> some View {
        Button(action: {
            
        }, label: {
            VStack {
                let url = URL(string:pickerItem.image)
                
//                Text("asset: \(pickerItem.assetNum)")
//                Text("Mode: \(pickerItem.model)")
                AsyncImage(url: url) { phase in
                    switch phase {
                    case.empty:
                        ProgressView()
                    case.success(let returnImage):
                        returnImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .cornerRadius(20)
                            .overlay {
                                Text(pickerItem.assetNum)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            }
                            
                    case.failure:
                        VStack(spacing:20){
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.system(size: 100))
                            
                            Text("No image found!")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                        
                    default:
                        Image(systemName: "questionmark")
                            .font(.title)
                    }
                }
               
            }
            .foregroundColor(.white)
//            .padding()
//            .frame(width: 200, height: 100)
//            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 10, x: 0, y: 10)
           
        })
    }
}


#Preview {
    NavigationSplit()
}

enum AssetCategory: String, CaseIterable {
    case Picker, SitDown, Forklift
}




struct PickerItem:  Hashable {
    let id = UUID()
    let assetNum: String
    let image: String
    let type: String
    let model: String
}

let pickerList = [
    PickerItem(assetNum: "4035", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
    PickerItem(assetNum: "4036", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
    PickerItem(assetNum: "4037", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
    PickerItem(assetNum: "4038", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
    PickerItem(assetNum: "4039", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
    PickerItem(assetNum: "4040", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
 
]
