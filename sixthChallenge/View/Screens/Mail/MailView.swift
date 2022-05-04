//
//  MailView.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 04/05/22.
//

import SwiftUI

struct MailView: View {

    var mail: Mail

    var body: some View {
        VStack {
            List {
                HStack {
                    ZStack {
                        Circle()
                            .fill(.gray)
                            .frame(width: 45, height: 45)
                        Text("BN")
                            .foregroundColor(.white)
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Text(mail.sender)
                            .font(.system(size: 16, weight: .bold))
                        HStack(spacing: 4) {
                            Text("Para:")
                                .font(.system(size: 14, weight: .bold))
                            Text("Bruno Nascimento")
                                .font(.system(size: 14, weight: .light))
                        }
                        
                    }
                    Spacer()
                    Text(mail.date)
                }
                VStack (spacing: 15) {
                    HStack {
                        Text(mail.subject)
                            .font(.system(size: 20, weight: .bold))
                        Spacer()
                    }
                    Text(mail.text)
                    Spacer()
                }
            }
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                Image(systemName: "trash")
                    .foregroundColor(.blue)
                    .font(.title3)
                Spacer()
                Image(systemName: "folder")
                    .foregroundColor(.blue)
                    .font(.title3)
                Spacer()
                Image(systemName: "arrowshape.turn.up.backward")
                    .foregroundColor(.blue)
                    .font(.title3)
                Spacer()
                Image(systemName: "square.and.pencil")
                    .foregroundColor(.blue)
                    .font(.title3)
                Spacer()
            }
        }
    }
}

struct MailView_Previews: PreviewProvider {
    static var previews: some View {
        MailView(mail: MailListViewModel().listMockData.first!)
    }
}
