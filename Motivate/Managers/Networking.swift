//
//  Networking.swift
//  Motivate
//
//  Created by T1001 on 2021-03-11.
//

import Foundation
import Alamofire
import FirebaseFunctions
import MLKit

private enum Const {
    static let addQuoteEndpoint = "https://us-central1-motivate-d5ed0.cloudfunctions.net/addQuote"
    static let getQuoteEndpoint = "https://us-central1-motivate-d5ed0.cloudfunctions.net/getQuote"
}

class Networking {
    
    private static var functions = Functions.functions()
    
    private static var snakeCaseParameterEncoder: JSONParameterEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return JSONParameterEncoder(encoder: encoder)
    }
    
    static func addQuoteRequest(_ quote: Quote, completion: @escaping (Result<Void, AFError>) -> Void) {
        AF.request(Const.addQuoteEndpoint,
                   method: .post,
                   parameters: quote)
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func getQuoteRequest(imageLabels: [ImageLabel], completion: @escaping (Result<String, AFError>) -> Void) {
        
        var parameters: Parameters = [:]
        
        imageLabels.forEach { parameters[$0.text] = $0.confidence }
        
        AF.request(Const.getQuoteEndpoint,
                   method: .get,
                   parameters: parameters)
            .validate()
            .responseString { response in
                completion(response.result)
            }
    }
}
