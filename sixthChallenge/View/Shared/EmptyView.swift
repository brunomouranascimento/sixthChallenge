//
//  EmptyView.swift
//  sixthChallenge
//
//  Created by Bruno Nascimento on 04/05/22.
//

import SwiftUI

struct EmptyView: View {
    
    @Binding var query: String
    
    var body: some View {
        Text("Sua busca não retornou resultados: \(query)")
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(query: .constant("ASGFAFGA"))
    }
}
