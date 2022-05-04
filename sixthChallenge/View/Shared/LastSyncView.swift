//
//  LastSyncView.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 04/05/22.
//

import SwiftUI

struct LastSyncView: View {
    let date: Date
    let dateFormatter: DateFormatter
    
    init() {
        date = Date()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
    }
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Sincronizado em:")
                Text(date, formatter: dateFormatter)
                Spacer()
            }
            Spacer()
        }
    }
}

struct LastSyncView_Previews: PreviewProvider {
    static var previews: some View {
        LastSyncView()
    }
}
