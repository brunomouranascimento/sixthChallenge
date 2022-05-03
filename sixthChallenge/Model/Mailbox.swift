//
//  Mailbox.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 03/05/22.
//

import Foundation

struct Mailbox: Identifiable {
    let id = UUID()
    let name: String
    let logo: String
    let isSystemImage: Bool
    let unreadEmails: Int
}

extension Mailbox {
    static let mainMockData: [Mailbox] = [
        Mailbox(name: "iCloud", logo: "icloud.fill", isSystemImage: true, unreadEmails: 2),
        Mailbox(name: "Gmail", logo: "gmail", isSystemImage: false, unreadEmails: 41),
        Mailbox(name: "Outlook", logo: "outlook", isSystemImage: false, unreadEmails: 9),
        Mailbox(name: "Yahoo", logo: "yahoo", isSystemImage: false, unreadEmails: 25)
    ]
}

extension Mailbox {
    static let smartMockData: [Mailbox] = [
        Mailbox(name: "Hoje", logo: "calendar.badge.exclamationmark", isSystemImage: true, unreadEmails: 18),
        Mailbox(name: "Não lidas", logo: "envelope.circle.fill", isSystemImage: true, unreadEmails: 77),
        Mailbox(name: "Importantes", logo: "exclamationmark.triangle.fill", isSystemImage: true, unreadEmails: 6),
        Mailbox(name: "Sinalizadas", logo: "flag.fill", isSystemImage: true, unreadEmails: 13)
    ]
}
