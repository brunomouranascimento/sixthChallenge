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
