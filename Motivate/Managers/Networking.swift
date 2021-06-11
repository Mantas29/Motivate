//
//  Networking.swift
//  Motivate
//
//  Created by T1001 on 2021-03-11.
//

import Foundation
import Alamofire
import FirebaseFunctions

private enum Const {
    static let addQuoteEndpoint = "https://us-central1-motivate-d5ed0.cloudfunctions.net/addQuote"
}

class Networking {
    
    private static var functions = Functions.functions()
    
    private static var snakeCaseParameterEncoder: JSONParameterEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return JSONParameterEncoder(encoder: encoder)
    }
    
    static func addQuoteRequest(_ quote: Quote, completion: @escaping (Result<Void, BasicError>) -> Void) {
        AF.request(Const.addQuoteEndpoint,
                   method: .post,
                   parameters: quote)
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(BasicError(code: error.responseCode,
                                                   message: error.errorDescription)))
                }
            }
    }
}

struct BasicError: Error {
    let code: Int?
    let message: String?
}
