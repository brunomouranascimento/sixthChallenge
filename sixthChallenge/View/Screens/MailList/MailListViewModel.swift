//
//  MailViewModel.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 04/05/22.
//

import Foundation

final class MailListViewModel: ObservableObject {
    @Published var listMockData: [Mail] = [
        Mail(sender: "Fulano Ciclano", subject: "Vamos jantar?", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: true, date: "22:21"),
        Mail(sender: "Fulano Beltrano", subject: "Convite de casamento", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: false, date: "20:52"),
        Mail(sender: "Bruno Nascimento", subject: "Lembrete de evento 📆", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: false, date: "20:21"),
        Mail(sender: "Karina Silva", subject: "Entrevista de emprego", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: true, date: "20:14"),
        Mail(sender: "João da Silva", subject: "Orçamento de reforma 💸", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: false, date: "19:30"),
        Mail(sender: "José Aparecido", subject: "Novas vagas disponíveis", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: true, date: "19:23"),
        Mail(sender: "Felipe Amaral", subject: "Futebol hoje à noite ⚽️", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: false, date: "18:59"),
        Mail(sender: "Lucas Santos", subject: "Ofertas imperdíveis", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: false, date: "18:44"),
        Mail(sender: "Michel Lopes", subject: "Irmandade Swift", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: false, date: "18:31"),
        Mail(sender: "Gustavo Henrique", subject: "Olá Bruno", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: true, date: "18:11"),
        Mail(sender: "Riachuelo", subject: "Moda outono-inverno", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: true, date: "17:33"),
        Mail(sender: "Nubank", subject: "Sua fatura fechou! 🤑", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: true, date: "16:45"),
        Mail(sender: "Spam 123", subject: "Ganhe muito dinheiro!", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: false, date: "16:00"),
        Mail(sender: "Banco Itaú", subject: "Seu PIX foi recebido", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: false, date: "10:11"),
        Mail(sender: "LinkedIn", subject: "Nova vaga de iOS Developer!", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", unread: true, date: "09:01")
    ]
    
    @Published var filteredMail = [Mail]()
    
    func searchMail(with query: String = "") {
        self.filteredMail = query.isEmpty ? listMockData : listMockData.filter { $0.sender.contains(query) }
    }
    
    func deleteEmail(at offsets: IndexSet) {
        self.filteredMail.remove(atOffsets: offsets)
    }
}
