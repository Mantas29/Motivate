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
                let quotes = Quotes.quoteList
                let firestoreManager = FirestoreManager()
                for quote in quotes {
                    firestoreManager.addQuote(quote: quote)
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
