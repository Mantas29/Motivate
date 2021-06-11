//
//  HomeView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var quoteList: [Quote] = []
    
    var body: some View {
        VStack {
            Button(action: {
                Networking.addQuoteRequest(Quote(text: "SOMETHING TEXT", keywords: [.airplane, .aquarium])) { result in
                    switch result {
                    case .success:
                        BaseViewModel.shared.showMessage(type: .success, message: "Quote added to database")
                    case .failure(let error):
                        BaseViewModel.shared.showMessage(type: .failed, message: error.message ?? "Something went wrong")
                    }
                }
            }, label: {
                Text("Add quotes to database")
            })
            
            Button(action: {
                let firestoreManager = FirestoreManager()
                firestoreManager.getQuotes { quotes in
                    quoteList = quotes
                }
            }, label: {
                Text("Get quotes from database")
            })
            
            ForEach(quoteList, id: \.text) { quote in
                Text(quote.text)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
