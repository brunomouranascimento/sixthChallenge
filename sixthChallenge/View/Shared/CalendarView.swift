//
//  CalendarView.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 04/05/22.
//

import SwiftUI

struct CalendarView: View {
    @State var date = Date()
    
    var body: some View {
        VStack {
            Section {
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
            } header: {
                HStack {
                    Text("Calendário")
                        .font(.title3)
                    Spacer()
                    Image(systemName: "gear")
                        .font(.title2)
                }
                .padding(.bottom)
                
            } footer: {
                LastSyncView()
            }
        .textCase(nil)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environment(\.locale, Locale.init(identifier: "pt"))
    }
}
