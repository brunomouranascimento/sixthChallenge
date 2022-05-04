//
//  SectionView.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 04/05/22.
//

import SwiftUI

struct SectionView: View {
    var mailBoxes: [Mailbox]
    var navigationTitle: String
    var mailBoxIcon: String
    var unreadEmails: String
    var headerTitle: String
    var showAllEmails: Bool? = false
    var showLastSync: Bool? = false
    
    var body: some View {
        Section {
            if showAllEmails! {
                NavigationLink(destination: MailView(navigationTitle: navigationTitle)) {
                    HStack {
                        Image(systemName: mailBoxIcon)
                            .foregroundColor(.indigo)
                            .padding(.horizontal, 8)
                        Text(navigationTitle)
                            .font(.headline)
                        Spacer()
                        
                        Text(unreadEmails)
                            .foregroundColor(.gray)
                    }
                }
            }
            ForEach(mailBoxes, id: \.id ) { mailBox in
                NavigationLink(destination: MailView(navigationTitle: mailBox.name)) {
                    MailBoxRowView(mailBox: mailBox)
                }
            }
        } header: {
            HStack {
                Text(headerTitle)
                    .font(.title3)
                Spacer()
                Image(systemName: "gear")
                    .font(.title2)
            }
            .padding(.horizontal, -15)
            .padding(.bottom)
            
        } footer: {
            if UIDevice.current.userInterfaceIdiom != .pad && showLastSync! {
                LastSyncView()
            }
        }
        .textCase(nil)
        .navigationTitle(headerTitle)
        
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            SectionView(mailBoxes: Mailbox.mainMockData, navigationTitle: "Todos os e-mails", mailBoxIcon: "tray.2", unreadEmails: "77", headerTitle: "E-mails", showAllEmails: true, showLastSync: true)
        }
    }
}
