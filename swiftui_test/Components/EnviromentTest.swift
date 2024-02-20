//
//  EnviromentTest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/19/24.
//

import SwiftUI

class EnviroViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
}



struct EnviromentTest: View {
    
    @StateObject var viewModel: EnviroViewModel = EnviroViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.dataArray, id:\.self){ item in
                    NavigationLink(
                        destination: detailedView(selectedItem: item)) {
                            Text(item)
                        }
                }
            }
            .navigationTitle("iOS Devices")
        }
        .environmentObject(viewModel)
    }
}


struct detailedView: View {
    let selectedItem: String
 
    
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea()
            
            NavigationLink(destination: FinalView()) {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundStyle(Color.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
            }
           
        }
    }
}

struct FinalView: View {
    @EnvironmentObject var viewNodel: EnviroViewModel
    
    var lColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    var sColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(lColor), Color(sColor)]),
                startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/,
                endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewNodel.dataArray, id: \.self) {item in
                        Text(item)
                        
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }

        }
    }
}


#Preview {
    EnviromentTest()
//    FinalView()
}
