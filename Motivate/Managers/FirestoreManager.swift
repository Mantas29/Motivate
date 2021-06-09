//
//  FirestoreManager.swift
//  Motivate
//
//  Created by T1001 on 2021-03-07.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

private enum Const {
    static let quotesCollectionPath = "Quotes"
}

class FirestoreManager {
    
    let db = Firestore.firestore()
    
    func addQuote(quote: Quote) {
        do {
            try db.collection(Const.quotesCollectionPath).document().setData(from: quote)
        } catch {
            BaseViewModel.shared.showMessage(type: .failed, message: "Could not add new quote to the database")
        }
    }
    
    func getQuotes(completion: @escaping ([Quote]) -> Void) {
        db.collection(Const.quotesCollectionPath).getDocuments { (querySnapshot, error) in
            if let error = error {
                BaseViewModel.shared.showMessage(type: .failed, message: "Could not load quotes from the database. Error: \(error)")
            } else {
                guard let documents = querySnapshot?.documents else { return }
                var quotes: [Quote] = []
                for document in documents {
                    if document.exists {
                        let result = Result {
                            try document.data(as: Quote.self)
                        }
                        switch result {
                        case .success(let quote):
                            if let quote = quote {
                                quotes.append(quote)
                            }
                        case .failure(let error):
                            BaseViewModel.shared.showMessage(type: .failed, message: "\(error)")
                        }
                    }
                }
                completion(quotes)
            }
        }
    }
}
