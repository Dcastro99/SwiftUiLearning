//
//  datePickertest.swift
//  swiftui_test
//
//  Created by Danny Castro on 2/9/24.
//

import SwiftUI

struct datePickertest: View {
    @State private var selectDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year:2018)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    var timeFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    var title = {
        HStack{
           Text(
            "name"
        )
            Image(systemName:"heart")
        }
    }
    
    var body: some View {
        
        
        VStack{
            Text("Selected date is::")
                .font(.headline)
                .padding(.vertical)
           RoundedRectangle(cornerRadius: 10)
                .overlay(
                    VStack{
               
                        Text(dateFormatter.string(from: selectDate))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding(.vertical)
                        Text(timeFormatter.string(from: selectDate))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                        Spacer()
                      
                    }
                      
                    .foregroundColor(.white)
                )
                .frame(width: 200, height: 200)
                .padding()
         
            Spacer()
            DatePicker( selection: $selectDate, in: startingDate...endingDate){
                HStack {
                   
                    Text("Choose Date")
                    Image(systemName: "arrowshape.forward.fill")
                        .foregroundColor(.red)
                }
            }
                .padding(.horizontal)
            //        DatePicker("Select a date", selection: $selectDate, displayedComponents: [.date,.hourAndMinute])
            //        DatePicker("Select Date", selection: $selectDate)
            //            .datePickerStyle(
            ////                CompactDatePickerStyle()
            //                WheelDatePickerStyle()
            ////                GraphicalDatePickerStyle()
            //            )
        }
        .padding(.vertical, 200)
      
      
    }
}

#Preview {
    datePickertest()
}
