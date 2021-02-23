//
//  UIApplication.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
