//
//  MailBoxRowView.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 04/05/22.
//

import SwiftUI

struct MailBoxRowView: View {
    @State var mailBox: Mailbox
    
    var body: some View {
        HStack {
            if mailBox.isSystemImage {
                Image(systemName: mailBox.logo)
                    .symbolRenderingMode(.multicolor)
                    .padding(.horizontal, 8)
            } else {
                Image(mailBox.logo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .padding(.horizontal, 10)
            }
            Text(mailBox.name)
                .font(.headline)
            Spacer()
            HStack {
                Text("\(mailBox.unreadEmails)")
            }
            .foregroundColor(.gray)
        }
    }
}

struct MailBoxRowView_Previews: PreviewProvider {
    static var previews: some View {
        MailBoxRowView(mailBox: Mailbox.mainMockData.first!)
    }
}
