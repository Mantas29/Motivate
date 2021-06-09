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
    static let helloWorldEndpoint = "https://us-central1-motivate-d5ed0.cloudfunctions.net/helloWorld"
}

class Networking {
    
    private static var functions = Functions.functions()
    
    static func request() {
        AF.request(Const.helloWorldEndpoint).responseString { response in
            print("Response: \(response)")
        }
    }
}
