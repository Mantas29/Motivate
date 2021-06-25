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
        VStack(spacing: 100) {
            
            Button(action: {
                Quotes.quoteList.forEach {
                    Networking.addQuoteRequest($0) { result in
                        switch result {
                        case .success:
                            print("added")
                        case .failure(let error):
                            BaseViewModel.shared.showMessage(type: .failed, message: error.localizedDescription ?? "Something went wrong")
                        }
                    }
                }
            }, label: {
                Text("Add quotes to database")
            })
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
