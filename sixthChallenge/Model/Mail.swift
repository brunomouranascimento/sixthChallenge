//
//  Mail.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 04/05/22.
//

import Foundation

struct Mail: Identifiable {
    let id = UUID()
    let sender: String
    let subject: String
    let text: String
    let unread: Bool
    let date: String
}
