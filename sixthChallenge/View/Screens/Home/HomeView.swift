//
//  HomeView.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 04/05/22.
//

import SwiftUI

struct HomeView: View {
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        NavigationView {
            List {
                SectionView(mailBoxes: Mailbox.mainMockData, navigationTitle: "Todos os e-mails", mailBoxIcon: "tray.2", unreadEmails: "77", headerTitle: "E-mails", showAllEmails: true)
                SectionView(mailBoxes: Mailbox.smartMockData, navigationTitle: "Todos os e-mails", mailBoxIcon: "tray.2", unreadEmails: "77", headerTitle: "Caixas inteligentes", showLastSync: true)
                if UIDevice.current.userInterfaceIdiom == .pad {
                    CalendarView()
                }
            }
            .navigationBarHidden(true)
        }
        .switchStyle(if: UIDevice.current.userInterfaceIdiom == .pad && orientation.isLandscape)
        .onRotate { newOrientation in
                    orientation = newOrientation
        }
    }
}

struct MailView: View {
    var navigationTitle: String

    var body: some View {
        HStack {
            Text(navigationTitle)
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
