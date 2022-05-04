//
//  MailRowView.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 04/05/22.
//

import SwiftUI

struct MailRowView: View {
    var mail: Mail
    
    var body: some View {
        HStack {
            Circle()
                .fill(mail.unread ? .blue : .clear)
                .frame(width: 10, height: 10)
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                Text(mail.sender)
                    .font(.system(size: 18, weight: .bold))
                Text(mail.subject)
                    .font(.system(size: 14, weight: .bold))
                Text(mail.text)
            }
            Spacer()
            Text(mail.date)
        }
    }
}

struct MailRowView_Previews: PreviewProvider {
    static var previews: some View {
        MailRowView(mail: MailListViewModel().listMockData.first!)
    }
}
