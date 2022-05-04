//
//  MailView.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 04/05/22.
//

import SwiftUI

struct MailListView: View {
    @StateObject var viewModel = MailListViewModel()
    @State private var searchTerm = ""
    
    var mailBoxName: String
    
    var body: some View {
        List {
            ForEach(viewModel.filteredMail, id:\.id) { mail in
                NavigationLink(destination: MailView(mail: mail)) {
                    MailRowView(mail: mail)
                }
            }
            .onDelete(perform: viewModel.deleteEmail)
        }
        .listStyle(.inset)
        .navigationTitle(mailBoxName)
        .searchable(text: $searchTerm, prompt: "Buscar remetente") {
            if viewModel.filteredMail.isEmpty {
                let randomSender = viewModel.listMockData.randomElement()!.sender
                Text("Talvez você esteja procurando por \(randomSender)?")
                    .searchCompletion(randomSender)
            }
        }
        .onSubmit(of: .search) {
            viewModel.searchMail(with: searchTerm)
        }
        .onChange(of: searchTerm) { newTerm in
            viewModel.searchMail(with: newTerm)
        }
        .onAppear {
            viewModel.searchMail()
        }
        .overlay {
            if viewModel.filteredMail.isEmpty {
                EmptyView(query: $searchTerm)
            }
        }
        .toolbar {
            EditButton()
        }
    }

}



struct MailListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MailListView(mailBoxName: "iCloud")
        }

        NavigationView {
            MailListView(mailBoxName: "iCloud")
                .preferredColorScheme(.dark)
        }
    }
}
